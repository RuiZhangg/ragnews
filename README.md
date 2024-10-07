## Ragnews ![](https://github.com/RuiZhangg/ragnews/workflows/tests/badge.svg)
This branch is for evaluating the quality of our RAG system using the Hairy Trumpet tool/dataset.

To use this file, also clone the submodule hairy-trumpt, get your GROQ_API_KEY and add it to your environment, then run 
```{bash}
python3 ragnews.py
```
For example, 
```{bash}
python3 ragnews.py
Question: The incumbent president, [MASK0], a member of the Democratic Party, initially ran for re-election and became the party's presumptive nominee, facing little opposition. However, [MASK0]'s performance in the June 2024 presidential debate intensified concerns about his age and health, and led to calls within his party for him to leave the race. Although initially adamant that he would remain in the race, [MASK0] ultimately withdrew on July 21 and endorsed Harris, who became the party's nominee on August 5. Harris selected Walz, the governor of Minnesota, as her running mate. [MASK0]'s withdrawal makes him the first eligible incumbent president since Lyndon B. Johnson in 1968 not to run for re-election, and the first to withdraw after securing enough delegates to win the nomination. Harris is the first nominee who did not participate in the primaries since Vice President Hubert Humphrey, also in 1968.
Actual labels: ['Biden']
Predicted labels: ['Biden']
----------------------------------------------------------------------
......
----------------------------------------------------------------------
Success: 102
Failure: 25
Success ratio: 0.80
```
Currently, it constantly gets a success ratio larger than 0.75 on `data/wiki__page=2024_United_States_presidential_election,recursive_depth=0__dpsize=paragraph,transformations=[canonicalize, group, rmtitles, split]` in haity-trumpet submodule.
