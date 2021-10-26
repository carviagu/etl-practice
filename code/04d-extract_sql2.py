# Conectamos a la base de datos
from sqlalchemy import create_engine
engine = create_engine('sqlite:///data/elections2016.sqlite')

# Trabajaremos con pandas
import pandas as pd

an_entire_table = pd.read_sql('SELECT * FROM IndexMeta', engine)
an_entire_table.head()
