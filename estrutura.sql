CONSTRAINT 'restricao1' FOREIGNKEY
('ID1') REFERENCES 'bloco'
('outraTabelaID1')

CONSTRAINT 'restricao2' FOREIGNKEY
('ID2') REFERENCES 'comunidade'
('outraTabelaID1')

CONSTRAINT 'restricao1' FOREIGNKEY
('ID3') REFERENCES 'distrito'
('outraTabelaID3')

CONSTRAINT 'restricao1' FOREIGNKEY
('ID4') REFERENCES 'regional'
('outraTabelaID4')

CONSTRAINT 'restricao1' FOREIGNKEY
('ID5') REFERENCES 'regiaoMetropolitana'
('outraTabelaID5')

CONSTRAINT 'restricao1' FOREIGNKEY
('ID6') REFERENCES 'subCoordenadoria'
('outraTabelaID6')

CONSTRAINT 'restricao1' FOREIGNKEY
('ID7') REFERENCES 'coordenadoria'
('outraTabelaID7')