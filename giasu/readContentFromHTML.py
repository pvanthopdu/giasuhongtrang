from bs4 import BeautifulSoup
import re

class ReadContentFromHtml:
    def __init__(self, fhtml):
        data = fhtml.read()
        # data = open(fhtml).read()
        soup = BeautifulSoup(data, 'html.parser')
        for tag in soup.findAll('p'):
            tag.attrs = None
        for tag in soup.findAll('span'):
            tag.attrs = None
        self.databody = str(soup.find(name='body'))
    # when convert file word to file html, it insert the other as v:shapetype, v:shape, m:oMath
    # then, we must remove this other out file html, after can read content of file html
    def standard(self):
        self.databody = re.sub('<v:shapetype', '<blockquote class="shapetype"', self.databody)
        self.databody = re.sub('</v:shapetype>', '</blockquote> ', self.databody)
        self.databody = re.sub('<v:shape', '<blockquote class="shape"', self.databody)
        self.databody = re.sub('</v:shape>', '</blockquote> ', self.databody)
        self.databody = re.sub('<m:oMath', '<blockquote class="oMath"', self.databody)
        self.databody = re.sub('</m:oMath>', '</blockquote> ', self.databody)
        self.databody = re.sub('<o:p></o:p>', '', self.databody)
        items = self.databody.split('<blockquote')
        stand = ''
        for item in items:
            child = item.split('</blockquote>')
            if len(child) == 2:
                stand += child[1].strip()
            elif len(child) == 1:
                stand += child[0].strip()
        return stand
    # format content of file word
    # <question>: start question
    # content of question
    # <option>: start option
    # option 1
    # option 2
    # option 3
    # option 4
    # if option is answer, it must format bold
    def readQuestions(self):
        # modify path image in content
        content = BeautifulSoup(self.standard(), 'html.parser')
        img = content.find_all(name='img')
        # modify path for shape
        for im in img:
            pathimg = '/media/questions' + im['src']
            im['src'] = im['src'].replace(im['src'], pathimg)
            im['class'] = 'img-fluid'
        # if paragraph has format "<question>", it'll start question
        # if paragraph has format "<option>", it'll start option
        # if paragraph has format "bold", it is answer
        paras = content.find_all('p')
        i_option = 0
        questions = list()
        question = dict()
        next_type = 0
        for para in paras:
            if para.text == "<question>":
                next_type = 1
            elif para.text == "<option>":
                i_option = 1
                next_type = 2
            elif next_type == 1:
                if 'content' in question:
                    question['content'] = question['content'] + str(para)
                else:
                    question['content'] = str(para)
            elif next_type == 2 and para.find(name='b'):
                question['option' + str(i_option)] = str(para)
                question['ans'] = str(para)
                i_option += 1
            elif next_type == 2:
                question['option' + str(i_option)] = str(para)
                i_option += 1
            if i_option > 4:
                questions.append(question)
                i_option = 0
                question = dict()
                next_type = 0
        return questions
