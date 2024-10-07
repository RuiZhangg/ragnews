'''
This file is for evaluating the quality of our RAG system using the Hairy
Trumpet tool/dataset.
'''
import sys
sys.path.append("..")
import ragnews

class RAGEvaluator:
    def __init__(self, labels, db):
        self.labels = labels
        self.db = db

    def predict(self, masked_text):
        '''
        >>> model = RAGEvaluator()
        >>> model.predict('There is no mask token here')
        []
        >>> model.predict('[MASK0] is the democratic nominee')
        ['Harris']
        >>> model.predict('[MASK0] is the democratic nominee and [MASK1] is the republican nominee')
        ['Harris', 'Trump']
        '''

        db = ragnews.ArticleDB(self.db)
        textprompt = f'''
        This is a question based on standard cloze style benchmarks.
        I'm going to provide you a sentence, and that sentence will have a token inside of it that will look like [MASK0] or [MASK1] or [MASK2] and so on.
        And your job is to tell me waht the value of that masked token was.

        The size of your output should just be a single word for each mask.
        You should not provide any explanation or other extraneous words.
        If there are multiple mask tokens, provide each token separately with a white space in between.
        Valid values include: {self.labels}

        INPUT: [MASK0] is the democratic nominee
        OUTPUT: Harris

        INPUT: [MASK0] is the democratic nominee and [MASK1] is the republican nominee
        OUTPUT: Harris Trump

        INPUT: Former President [MASK0] was briefed Tuesday about "real and specific threats" from Iran to assassinate the Republican presidential candidate, according to his campaign. Iran's aim to assassinate [MASK0] is part of the Islamic Republic's efforts to "destabilize and sow chaos in the United States," [MASK0] Campaign Communications Director Steven Cheung said in a press release. 
        OUTPUT: Trump

        INPUT: {masked_text}
        OUTPUT: '''

        output = ragnews.rag(textprompt, db, keywords_text=masked_text)
        result = output.split()

        return result


if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--db', default='../ragnews.db')
    parser.add_argument('--path', default="../hairy-trumpet/data/wiki__page=2024_United_States_presidential_election,recursive_depth=0__dpsize=paragraph,transformations=[canonicalize, group, rmtitles, split]")
    args = parser.parse_args()

    import json
    labels = set()
    with open(args.path) as fin:
        for i, line in enumerate(fin):
            dp = json.loads(line)
            labels.update(dp['masks'])
    
    model = RAGEvaluator(labels, args.db)

    success = 0
    failure = 0

    with open(args.path) as file:
        data = [json.loads(line) for line in file]

    for i, line in enumerate(data):
        print('Question:', line['masked_text'])
        print('Actual labels:', line['masks'])
        prediction = model.predict(line['masked_text'])
        print('Predicted labels:', prediction)
        print('-' * 70)
        if (all(x == y for x, y in zip(line['masks'], prediction))):
            success += 1
        else:
            failure += 1

    # Print the results
    print('Success: %d' % success)
    print('Failure: %d' % failure)

    total = success + failure
    if total > 0:
        success_ratio = success / total
        print('Success ratio: %.2f' % success_ratio)
    else:
        print('No data')