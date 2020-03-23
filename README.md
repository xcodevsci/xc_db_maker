# xc db maker

This package is use to create easily an instance of sqlite db and ready to use.

## Get an Sqlite Database instance

'''
    await Make.xcCreationTables(dbname: "dbname", listTables:listTables );
    Database _db = Make.db
'''
## Futures

12 basiques functions in French and English version

- xcAdd () or xcAjoute() : adding an entity
- xcReadFirst() or xcLitPremier() : Read first row in table
- xcReadLast() or xcLitDerneir() : Read last row in table
- xcModify() or xcModifie() : Modify current entity
- xcDelete() or xcSupprime() : Delete current entity
- xcDeleteAll() or xcSupprimeTout() : Delete all entity
- xcFind() or xcTrouve() : Seach in entity
- xcReadNext() or xcLitSuivant() : Read next row
- xcReadPrevious() or xcPrecedent() : Read previous row