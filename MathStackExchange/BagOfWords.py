import nltk


def co():
    dict = {}
    globalDict = nltk.FreqDist()
    index = 1
    f1 = open('QuestionsBothProcessed.txt', 'r')
    for line in f1:
        words = line.split()
        [globalDict.inc(word) for word in words]
    print len(globalDict)

    for key in globalDict:
        if globalDict[key] > 10: #10000 for SO, 100 for math
            dict[key] = index
            index += 1
    print len(dict)
    #print dict.keys()

    f1 = open('QuestionsBothProcessed.txt', 'r')
    f2 = open('QuestionsFeature.txt', 'w')

    index_line = 1
    for line in f1:
        words = line.split()
        localDict = nltk.FreqDist()
        [localDict.inc(word) for word in words]
        for word in localDict:
            if word in dict:
                f2.write(str(index_line) + " " + str(dict[word]) + " " + str(localDict[word]))
                f2.write("\n")
        index_line += 1

def tag():
    dict = {}
    globalDict = nltk.FreqDist()
    index = 1
    f1 = open('QuestionsTags_removeLowNumTags.txt', 'r')
    for line in f1:
        words = line.split()
        [globalDict.inc(word) for word in words]
    print len(globalDict)

    for key in globalDict:
        #print key
        dict[key] = index
        index += 1
    print len(dict)
    #print dict.keys()

    f1 = open('QuestionsTags_removeLowNumTags.txt', 'r')
    f2 = open('QuestionsLabel.txt', 'w')

    index_line = 1
    for line in f1:
        words = line.split()
        localDict = nltk.FreqDist()
        [localDict.inc(word) for word in words]
        for word in localDict:
            if word in dict:
                f2.write(str(index_line) + " " + str(dict[word]) + " 1")
                f2.write("\n")
        index_line += 1



if __name__ == '__main__':
    co()
    tag()
