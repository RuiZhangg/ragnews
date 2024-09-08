#!/bin/sh

#https://www.washingtonpost.com/elections/election-2024/
urls='
https://apnews.com/hub/donald-trump
https://apnews.com/hub/kamala-harris
https://apnews.com/hub/election-2024
https://www.cnn.com/election/2024
https://www.foxnews.com/elections
https://www.nytimes.com/topic/subject/elections
https://www.nytimes.com/news-event/2024-election
https://elpais.com/internacional/elecciones-usa/
https://www.la-prensa.com.mx/tags/temas/Elecciones_Estados_Unidos
https://www.cronica.com.mx/temas/estados-unidos/2
https://www.jornada.com.mx/tag/estados%20unidos
https://calmatters.org/category/politics/elections/
https://www.nbcnews.com/politics/2024-presidential-election
https://www.bbc.com/news/topics/cj3ergr8209t
https://abcnews.go.com/Elections
https://www.politico.com/news/2024-elections
https://www.npr.org/sections/elections/
https://www.reuters.com/world/us/elections/
https://abcnews.go.com/538
https://www.270towin.com/news/
https://www.aljazeera.com/tag/us-election-2024/
https://www.wsj.com/politics/elections
https://www.cnbc.com/elections/
https://www.cnn.com/politics
https://electionline.org/
https://www.texastribune.org/series/texas-2024-election-voting/
https://abcnews.go.com/elections
https://www.nationalreview.com/2024-election/
https://www.dailysignal.com/
https://www.vox.com/politics
https://prospect.org/topics/election-2024/
https://www.seattletimes.com/nation-world/
https://www.newsweek.com/topic/2024-election
https://thehill.com/elections/
https://www.allsides.com/topics/2024-presidential-election
https://www.theamericanconservative.com/
https://www.axios.com/politics-policy/us-presidential-house-senate-elections
https://www.washingtonexaminer.com/election-2024/
https://ground.news/interest/us-politics_3c3c3c
https://www.factcheck.org/
https://www.ft.com/us-presidential-election-2024
https://cnnespanol.cnn.com/category/elecciones-estados-unidos/
https://elpais.com/noticias/elecciones-eeuu/
https://www.univision.com/temas/elecciones-en-eeuu
https://www.rtve.es/noticias/elecciones-estados-unidos
https://www.telemundo.com/noticias/elecciones-estados-unidos-2024
https://www.eitb.eus/es/elecciones/elecciones-estados-unidos/
https://www.bbc.com/mundo/topics/c1v8en6r2qgt
https://www.vozdeamerica.com/z/7517
https://www.lanacion.com.ar/tema/elecciones-en-estados-unidos-tid52610/
https://www.elmundo.es/elecciones/elecciones-estados-unidos.html
https://us.as.com/noticias/elecciones-eeuu/
https://www.clarin.com/tema/elecciones-en-estados-unidos.html
https://es.euronews.com/tag/elecciones-presidenciales-estados-unidos
https://www.eluniverso.com/temas/elecciones-en-estados-unidos/
https://www.vozdeamerica.com/z/7517
https://expansion.mx/tag/elecciones-estados-unidos-2024
https://www.eltiempo.com/noticias/elecciones-en-ee-uu
https://www.larepublica.co/elecciones-eeuu
https://cadenaser.com/tag/elecciones_eeuu/a/
https://uswahl.lpb-bw.de/
https://www.zdf.de/nachrichten/thema/usa-wahlen-100.html
https://www.tagesschau.de/ausland/uswahl
https://www.srf.ch/news/international/us-wahlen-2024
https://de.statista.com/themen/1030/us-wahl/
https://www.fr.de/politik/us-wahl-ere80001/
https://www.ynet.co.il/topics/%D7%91%D7%97%D7%99%D7%A8%D7%95%D7%AA_%D7%91%D7%90%D7%A8%D7%94%22%D7%91_2024
https://www.haaretz.co.il/news/world/america/us-election
https://www.israelhayom.co.il/tag/%D7%94%D7%91%D7%97%D7%99%D7%A8%D7%95%D7%AA-%D7%91%D7%90%D7%A8%D7%94%D7%91-2
https://www.themarker.com/wallstreet/uselection
https://www.idi.org.il/tags/1717
https://www.holosameryky.com/vybory-u-ssha-2024
https://lb.ua/tag/19152_vibori_prezidenta_ssha_2024
https://suspilne.media/829993-vibori-v-ssa-u-razi-peremogi-trampa-mask-ocolit-uradovu-komisiu-z-efektivnosti/
https://www.bbc.com/ukrainian/topics/cxmpx47892rt
https://www.rbc.ua/rus/tag/vybory-v-ssha-13042015
https://explainer.ua/vybory-prezydenta-ssha-koly-vidbudutsya-ta-hto-balotuvatymetsya/
https://suspilne.media/tag/vibori-u-ssa/
https://www.radiosvoboda.org/a/prezydentski-vybory-v-usa/30926230.html
https://tsn.ua/svit/hto-peremozhe-na-prezidentskih-viborah-u-ssha-analiz-the-week-2495305.html
https://espreso.tv/vybory_u_ssha
https://www.holosameryky.com/a/chomu-vybory-u-ssha-odni-iz-naidorozhchyh/7659379.html
https://www.bbc.com/russian/topics/ce802g1vrdgt
https://www.dw.com/ru/prezidentskie-vybory-v-ssa-2024-goda/t-68191839
https://www.rbc.ru/story/5f161c1b9a794775d64857a6
https://www.imemo.ru/index.php?page_id=2211
https://washington.mid.ru/ru/press-centre/news/17_marta_2024_goda_sostoyatsya_vybory_prezidenta_rossiyskoy_federatsii/
https://www.eurotopics.net/ru/313689/%D1%81%D1%88%D0%B0-%D0%BF%D1%80%D0%B5%D0%B7%D0%B8%D0%B4%D0%B5%D0%BD%D1%82%D1%81%D0%BA%D0%B8%D0%B5-%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%D1%8B-2024
https://iz.ru/story/vybory-prezidenta-ssha
https://www.rbc.ru/politics/06/09/2024/66d9a0bc9a7947197fa1a0a2
https://lenta.ru/articles/2024/02/06/vybory-prezidenta-ssha-v-2024-godu/
https://www.dw.com/ru/vybory-prezidenta-ssha/t-19297417
https://www.svoboda.org/a/prezidentskie-vybory-v-ssha-2024-vnovj-tramp-protiv-baydena/32850797.html
https://iz.ru/1524300/2023-06-07/vybory-v-ssha-2024-kto-budet-borotsia-za-prezidentskoe-kreslo
http://electoralpolitics.org/ru/articles/geografiia-i-statistika-rezultatov-prezidentskikh-vyborov-v-ssha-kliuch-k-ponimaniiu-ikh-dostovernosti/
https://ria.ru/event_Prezidentskie_vybory_v_SSHA/
https://www.golosameriki.com/z/7590
https://arabic.cnn.com/specials/us-election-2024
https://www.france24.com/ar/%D8%AA%D8%A7%D8%BA/%D8%A7%D9%84%D8%A7%D9%86%D8%AA%D8%AE%D8%A7%D8%A8%D8%A7%D8%AA-%D8%A7%D9%84%D8%A3%D9%85%D8%B1%D9%8A%D9%83%D9%8A%D8%A9/
https://arabic.cnn.com/tag/american_elections
https://www.bbc.com/arabic/topics/cz9e2lezpn0t
https://www.mfnca.gov.ae/ar/media/altamkin-newsletter-content/presidents-election-system-in-the-united-states-of-america/
https://arabic.rt.com/focuses/848554-%D8%A7%D9%84%D8%A7%D9%86%D8%AA%D8%AE%D8%A7%D8%A8%D8%A7%D8%AA-%D8%A7%D9%84%D8%A3%D9%85%D8%B1%D9%8A%D9%83%D9%8A%D8%A9/
https://www.ig.com/ar-ae/financial-events/us-presidential-election
https://www.dw.com/ar/%D8%A7%D9%84%D8%A7%D9%86%D8%AA%D8%AE%D8%A7%D8%A8%D8%A7%D8%AA-%D8%A7%D9%84%D8%A3%D9%85%D8%B1%D9%8A%D9%83%D9%8A%D8%A9/t-36016927
https://www.skynewsarabia.com/live-story/1669300-%D8%A7%D9%84%D8%B7%D8%B1%D9%8A%D9%82-%D8%A7%D9%84%D8%A8%D9%8A%D8%AA-%D8%A7%D9%84%D8%A7%D9%94%D8%A8%D9%8A%D8%B6-%D8%A7%D9%93%D8%AE%D8%B1-%D9%85%D8%B3%D8%AA%D8%AC%D8%AF%D8%A7%D8%AA-%D8%A7%D9%86%D8%B3%D8%AD%D8%A7%D8%A8-%D8%A8%D8%A7%D9%8A%D8%AF%D9%86
https://www.voachinese.com/z/7869
https://apiavote.org/%E9%80%89%E4%B8%BE%E8%B5%84%E6%96%99/
https://cn.wsj.com/zh-hans/news/collection/us-election-2024-cn-468898fc
https://www.bbc.com/zhongwen/simp/world-69324800
http://www.news.cn/world/20240404/d74169abb4324d4b930169cbdb6a0b52/c.html
https://www.usnews.com/topics/subjects/elections
'

for url in $urls; do
    echo url
    python3 ragnews.py $url --recursive_depth=1 --db=elections.db --loglevel=DEBUG
done
