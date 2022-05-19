import os
from datetime import datetime
import pandas as pd

# Parameters
input_file = '~/documents/finances/nubank_evf_data/NU_86615107_01JAN2021_31DEZ2021.csv'
output_file = '/home/evf/documents/finances/ledger/script_output.ledger'#os.path.dirname(input_file)+'/output.ledger'
default_account = 'Banking:evf:Nubank'

# Read data
df = pd.read_csv(input_file, header=0)
df.Data = pd.to_datetime(df.Data, dayfirst=True)
df.sort_values(by='Data', inplace=True)
print(df)

# Output file
with open(output_file, 'w') as f:
    for idx, row in df.iterrows():
        # Date format
        date_str = row.Data.strftime('%Y-%m-%d')
        # Amount format
        amount_cent = int(-100*row.Valor)
        amount_str = str(abs(amount_cent))
        amount_str = 'R$' + amount_str[:-2] + '.' + amount_str[-2:]
        if amount_cent < 0:
            amount_str = '-' + amount_str
        # Ledger entry
        entry_str =  date_str+' * ' + row.Descrição
        entry_str += '\n\tDestinationAccount\t' + amount_str
        entry_str += '\n\t' + default_account + '\n\n'
        # Write entry
        f.write(entry_str)
