import re
import nltk

class DataCleaner:
    def __init__(self):
        try:
            self.stop = nltk.corpus.stopwords.words('english')
            self.pattern = self.construct_pattern()
        except Exception as e:
            print(f"Error initializing stopwords: {e}")
            self.stop = []
            self.pattern = ""

    def construct_pattern(self):
        try:
            return r'\s*\b(?:' + '|'.join(map(re.escape, self.stop)) + r')\b|[^\w\s]'
        except Exception as e:
            print(f"Error constructing pattern: {e}")
            return ""

    def clean_text(self, text):
        try:
            clean_data = [None]
            for _ in range(1):
                clean_data[0] = text.lower().split('\n')
                clean_data[0] = list(map(lambda x: re.sub(self.pattern, '', 
                                                          x.replace("'", '"')), clean_data[0]))
            return clean_data[0]
        except AttributeError:
            print("Error: Input text is not a string.")
            return []
        except Exception as e:
            print(f"Error cleaning text: {e}")
            return []

# # Example usage
# cleaner = DataCleaner()
# cleaned_text = cleaner.clean_text("This is a sample text with some stop words.")
# print(cleaned_text)
