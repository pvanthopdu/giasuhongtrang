import requests
from bs4 import BeautifulSoup

class ReadContentHTML:

    def __init__(self, url) -> None:
        url = url.replace("|", "/")
        req = requests.get(url)
        soup = BeautifulSoup(req.text, 'html.parser')

        # get content follow attrib class or id
        self.articleDetail = soup.find(name='div', attrs={'class': 'ArticleDetail'})

    def getTitle(self):
        return self.articleDetail.find(name='h1', attrs={'class': 'title'}).getText()
    def getDatepub(self):
        return self.articleDetail.find(name='span', attrs={'class': 'ArticleDate'}).getText()

    def getArticleContent(self):
        articlecontent = self.articleDetail.find(name='div', attrs={'class': 'ArticleContent'})
        # remove element follow class or id
        for ads in articlecontent.findAll(name='img', attrs={'class': 'logo-small'}):
            ads.decompose()
        for ads in articlecontent.findAll(name='div', attrs={'class': 'VnnAdsPos'}):
            ads.decompose()
        for ads in articlecontent.findAll(name='div', attrs={'class': 'm-b-10'}):
            ads.decompose()
        for ads in articlecontent.findAll(name='div', attrs={'class': 'inner-article'}):
            ads.decompose()
        return articlecontent.prettify()

    def getInner_article(self):
        # get inner_article
        inner_articles = self.articleDetail.findAll(name='div', attrs={'class': 'inner-article'})
        inner = list()
        for inner_article in inner_articles:
            title = inner_article.find(name='h4', attrs={'class': 'title'}).text
            sumary = inner_article.find(name='p', attrs={'class': 'summary'}).text
            link = "http:"+inner_article.find(name='a', href = True).get('href').replace("#inner-article", "").replace("/", "|")
            img = inner_article.find(name='img').get("src")
            inner_content={
                'title': title,
                'summary': sumary,
                'link': link,
                'img': img
            }
            inner.append(inner_content)
        return inner

# article = ReadContentHTML("http://vietnamnet.vn/vn/giao-duc/guong-mat-tre/cau-be-12-tuoi-lam-hieu-truong-truong-tu-thuc-495345.html")
# print(article.getInner_article())