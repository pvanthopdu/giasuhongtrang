import requests
import urllib3
import re
import feedparser
from bs4 import BeautifulSoup

def readRSS():
    source = requests.get('http://vietnamnet.vn/rss/giao-duc.rss')
    data = source.text
    data = data.replace("</item>", "<item>").replace("<item><item>", "<item>").split("<item>")
    print(data)


if __name__ == '__main__':
    readRSS()