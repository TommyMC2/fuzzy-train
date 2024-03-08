import spacy

# Import the English language model from spaCy
from spacy.lang.en import English

# Load English tokenizer, tagger, parser, NER, and word vectors
nlp = English()

# List of file names
file_names = ['tmc-chatgpt-results-txt1.txt', 'tmc-chatgpt-results-txt2.txt', 'tmc-chatgpt-results-txt3.txt']

for file_name in file_names:
    # Read the text file
    with open(file_name, 'r') as file:
        text = file.read()
