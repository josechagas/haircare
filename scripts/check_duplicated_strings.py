import json
import os
import sys

stringsFound = {}

def checkForDuplicatedStrings(directory):
    #Vasculha diretorio do projeto, buscando por arquivos .xcstrings
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(".xcstrings"):
                #Le arquivo registrando as strings presentes nele em 'stringsFound'
                filePath = os.path.join(root, file)
                try:
                    with open(filePath, 'r', encoding='utf-8') as f:
                        data = json.load(f)
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
                except Exception as e:
                    print(f"{filePath}:1: warning: Erro ao ler arquivo: {e}")

if __name__ == "__main__":
    projectDir = sys.argv[1] if len(sys.argv) > 1 else "."
    checkForDuplicatedStrings(projectDir)
    found_any_duplicate = False
    for value, locations in stringsFound.items():
        if len(locations) > 1:
            found_any_duplicate = True
            for loc in locations:
                print(f"{loc['path']}:1: error: Texto duplicado detectado: '{value}' (Chave: {loc['key']})")

    sys.exit(found_any_duplicate)
    