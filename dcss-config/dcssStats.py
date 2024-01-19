from os import listdir, chdir
from os import remove as rm
from os.path import isfile, join


def scoreSort(e):
    return e['score']


def seedSort(e):
    return e['seed']


def FixBrokenGames(data):
    testedSeeds = []
    brokenSeeds = []

    for x in data:
        if (x['seed'] in testedSeeds and x['seed'] not in brokenSeeds):
            brokenSeeds.append(x['seed'])
        else:
            testedSeeds.append(x['seed'])

    for x in [x for x in data if x['seed'] in brokenSeeds]:
        rm(x['filename'])
        data.remove(x)


def PrintStats(data):
    totalTime = 0
    for entry in data:
        for t in entry['time'].split(":"):
            totalTime += int(t)*pow(60, 2-entry['time'].split(":").index(t))

    print('Wins:')
    for x in data:
        if x['won']:
            print("Level " + str(x['level']) + " " + x["species"] + " " + x["background"] + " of " + x["god"] + " (" + str(x['runes']) + " runes)\n\tScored " +
                  str(x["score"]) + " in " + x["time"] + " on " + x["date"])

    print()
    print("Top 10:")
    for x in data[:10]:
        print("Level " + str(x['level']) + " " + x["species"] + " " + x["background"] + " of " + x["god"] + " (" + str(x['runes']) + " runes)\n\tScored " +
              str(x["score"]) + " in " + x["time"] + " on " + x["date"])

    print()
    print("Stats:")
    print("Total time played: " + str(round((totalTime/60/60), 2)) + " hours")
    print("Total games played: " + str(len(data)))
    print("Total wins: " + str(len([x for x in data if x['won']])))
    print("High Score: " + str(data[0]['score']))
    print("Win Percentage: " +
          str(round(len([x for x in data if x['won']])/len(data)*100, 2)) + "%")


def updateDictionary(dictionary, line, matchString, extractFunction, dictKey, flag=[False]):
    if (matchString in line and not flag[0]):
        flag[0] = True
        dictionary.update({dictKey: extractFunction(line)})


def main():
    morguePath = "/mnt/media/git/personal/dcss_morgue"
    matchStrings = ["Game seed:", "level", "The game lasted", "Began as",
                    "Began as", "Began as", "You worshipped", "Escaped with the Orb", "}:", "XL"]
    # Basically the transform function applied to the line to get the data we want
    extractFunctions = [lambda x: int(x.split(":")[1].strip()),  # seed
                        lambda x: int(x.split(" ")[0]),  # score
                        lambda x: x.strip().split(" ")[3],  # time
                        lambda x: x.strip().split(" ")[3],  # species
                        lambda x: x.strip().split(" ")[4],  # background
                        lambda x: x.strip().split(
                            "on")[-1].strip()[:-1],  # date
                        lambda x: x.strip().split(" ")[2].split(".")[0],  # god
                        lambda x: True,  # won
                        lambda x: int(x.strip().split(
                            " ")[1].split("/")[0]),  # runes
                        lambda x: int(x.strip().split(
                            ":")[4].strip().split(" ")[0])  # level
                        ]
    dictKeys = ['seed', 'score', 'time', 'species',
                'background', 'date', 'god', 'won', 'runes', 'level']

    morgueFiles = [f for f in listdir(morguePath) if isfile(
        join(morguePath, f)) and f.startswith("morgue-") and f.endswith(".txt")]
    chdir(morguePath)

    data = []
    for filename in morgueFiles:
        fileValues = {}
        with open(filename) as f:
            content = f.read().splitlines()
            flags = []
            for i in range(len(matchStrings)):
                flags.append([False])
            for line in content:
                for i in range(len(matchStrings)):
                    updateDictionary(
                        fileValues, line, matchStrings[i], extractFunctions[i], dictKeys[i], flags[i])
            if (dictKeys[0] not in fileValues):
                continue
            else:
                if dictKeys[6] not in fileValues:
                    fileValues.update({dictKeys[6]: "Atheist"})
                if dictKeys[7] not in fileValues:
                    fileValues.update({dictKeys[7]: False})
                    fileValues.update({dictKeys[8]: 0})
                fileValues.update({'filename': filename})
                data.append(fileValues)
    data.sort(key=scoreSort, reverse=True)
    FixBrokenGames(data)
    PrintStats(data)


if __name__ == "__main__":
    main()
