# structure of file word: load questions no pucture, expression
# <question>
# content of question
# <option>
# content option

import docx
class ReadQuestionsFromWord:
    def __init__(self, file):
        doc = docx.Document(file)
        self.questions = list()
        index = 0
        question = dict()
        next_type = 0
        for para in doc.paragraphs:
            if para.text == "<question>":
                next_type = 1
            elif para.text == "<option>":
                index = 1
                next_type = 2
            elif next_type == 1 and para.text!='':
                if 'content' in question:
                    question['content'] = question['content'] + para.text
                else:
                    question['content'] = para.text
            elif next_type == 2:
                question['option' + str(index)] = para.text
                index += 1
            if index > 4:
                self.questions.append(question)
                index = 0
                question = dict()
                next_type = 0