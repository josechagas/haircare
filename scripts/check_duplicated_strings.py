import json
import os
import sys

def stringsOn(filePath):
    stringsFound = {}
    with open(filePath, 'r', encoding='utf-8') as file:
        data = json.load(file)
        sourceLanguage = data.get('sourceLanguage', 'en')
        strings = data.get('strings', {})
        
        for key, content in strings.items():
            localizations = content.get('localizations', {})
            # Pega o valor da tradução na língua de origem
            value = localizations.get(sourceLanguage, {}).get('stringUnit', {}).get('value')
            
            if value:
                if value not in stringsFound:
                    stringsFound[value] = []
                
                stringsFound[value].append({
                    'path': filePath,
                    'key': key
                })
    return stringsFound

def mergeItems(currentItems, newItems):
    mergedItems = currentItems
    for key, value in newItems.items():
        if key not in mergedItems:
            mergedItems[key] = value
        else:
            mergedItems[key] += value
    return mergedItems


def checkForDuplicatedStrings(directory):
    #Vasculha diretorio do projeto, buscando por arquivos .xcstrings
    stringsFound = {}
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(".xcstrings"):
                filePath = os.path.join(root, file)
                try:
                    #Le arquivo registrando as strings presentes nele em 'stringsFound'
                    print("\t👀 Lendo ", filePath)
                    newStringsFound = stringsOn(filePath)
                    stringsFound = mergeItems(stringsFound, newStringsFound)
                except Exception as error:
                    print(f"{filePath}:1: warning: Erro ao ler arquivo: {error}")
    return stringsFound

if __name__ == "__main__":
    projectDir = sys.argv[1] if len(sys.argv) > 1 else "."
    stringsFound = checkForDuplicatedStrings(projectDir)
    found_any_duplicate = False
    #Itera sobre todas os valores de 'stringsFound' registrando os erros quando temos mais de um item em 'locations'
    for value, locations in stringsFound.items():
        if len(locations) > 1:
            found_any_duplicate = True
            for loc in locations:
                print(f"{loc['path']}:1: error: Texto duplicado detectado: '{value}' (Chave: {loc['key']})")
    sys.exit(found_any_duplicate)
    