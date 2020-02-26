import requests
import urllib3
import re
import feedparser
from bs4 import BeautifulSoup


class ReadconentRSS:
    @staticmethod
    def getCateNews():
        # http = urllib3.PoolManager()
        # response = http.request('GET', "https://vietnamnet.vn/rss/giao-duc.rss")
        # data = response.data.decode('utf-8')
        source = requests.get('http://vietnamnet.vn/rss/giao-duc.rss')
        data = source.text
        data = data.replace("</item>", "<item>").replace("<item><item>", "<item>").split("<item>")
        print(data)
        cateNews = list()
        p = re.compile('<title>|</title><description>|</description><link>|</link><pubDate>|</pubDate><image>|</image>')
        p4 = re.compile('<p class="t-j">|<p>|</p>')
        for i in range(1, 10):
            article = p.sub('<tag>', data[i])
            article = article.replace('<tag>', '', 1)
            titles = article.split("<tag>")
            descriptions = p4.split(titles[1])
            cateChild = {
                'title': titles[1],
                'description': descriptions[0],
                'link': titles[2].replace("/", "|"),
                'pubDate': titles[2],
                'image': titles[2],
            }
            cateNews.append(cateChild)

        return cateNews

    @staticmethod
    def getCateNewsFeed():
        feed= feedparser.parse('https://vietnamnet.vn/rss/giao-duc.rss')
        i =1
        cateNews = list()
        for post in feed.entries:
            title = post.title
            link = post.link
            published = post.published
            summary = post.summary
            media_content = post.media_content[0]
            image = media_content['url']
            cateChild = {
                'title': title,
                'description': summary,
                'link': link.replace("/", "|"),
                'pubDate': published,
                'image': image
            }
            cateNews.append(cateChild)
            i +=1
            if i>10:
                break
        return cateNews
