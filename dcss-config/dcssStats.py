from os import listdir, chdir
from os.path import isfile, join


def dataSortKey(e):
    return e['score']


mypath = "/media/git/personal/dcss_morgue"
chdir(mypath)

onlyfiles = [f for f in listdir(
    mypath) if isfile(join(mypath, f)) and f.endswith(".txt") and f.startswith("morgue-")]

data = []
brokenFiles = []

for filename in onlyfiles:
    fileValues = {}
    with open(filename) as f:
        content = f.read().splitlines()
        scoreAdded = False
        timeAdded = False
        speciesAdded = False
        godAdded = False
        won = False
        for line in content:
            if (line.startswith("Game seed:")):
                seedValue = line.split(":")[1].strip()
                fileValues.update({'seed': int(seedValue)})
            if ("level" in line and not scoreAdded):
                scoreAdded = True
                scoreValue = line.split(" ")[0]
                nameValue = line.split(" ")[1]
                fileValues.update({'score': int(scoreValue)})
                fileValues.update({'name': nameValue})
            if ("The game lasted" in line and not timeAdded):
                timeAdded = True
                timeValue = line.strip().split(" ")[3]
                fileValues.update({'time': timeValue})
            if ("Began as a" in line and not speciesAdded):
                speciesAdded = True
                speciesValue = line.strip().split(" ")[3]
                backgroundValue = line.strip().split(" ")[4]
                fileValues.update({'species': speciesValue})
                fileValues.update({'background': backgroundValue})
            if ("You worshipped" in line and not godAdded):
                godAdded = True
                godValue = line.strip().split(" ")[2].split(".")[0]
                fileValues.update({'god': godValue})
            if ("Escaped with the Orb" in line):
                won = True
                fileValues.update({'won': True})
        if ('seed' not in fileValues):
            brokenFiles.append(filename)
        else:
            if (not godAdded):
                fileValues.update({'god': "Atheist"})
            if (not won):
                fileValues.update({'won': False})
            fileValues.update({'filename': filename})
            data.append(fileValues)

data.sort(key=dataSortKey)

totalTime = 0

for entry in data:
    for t in entry['time'].split(":"):
        totalTime += int(t)*pow(60, 2-entry['time'].split(":").index(t))

print("Total time played: " + str(totalTime/60/60) + " hours")
print("Total games played: " + str(len(data)))
print("Total wins: " + str(len([x for x in data if x['won']])))
print("High Score: " + str(data[-1]))
print("Wins data: " + str([x for x in data if x['won']]))
