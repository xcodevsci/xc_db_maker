
This package is use to create easily an instance of sqlite db and ready to use. Quick and easy to integrate

## Get an xc Database instance

```
    await Make.xcCreationTables(dbname: "dbname", listTables:listTables );
    Database _db = Make.db
```
## Exambles
```
    List<Tables> listTables = <Tables>[
      Tables(
          name: "client",
    
          columns: '''
              fullname TEXT NULL,
              city TEXT NULL,
              country TEXT NULL,
              address TEXT NULL
              '''
      ),
      Tables(
          name: "user",
          columns: '''
              login TEXT NULL,
              pwd TEXT NULL
              '''
      ),
      //....
    ];
    await Make.xcCreationTables(dbname: "dbname", listTables:listTables );
    
    //Create an entity

    class Client {
      final fullname;
      final city;
      final country;
      final address;
    
      Client({
        this.fullname,
        this.city ,
        this.country,
        this.address
      });
    
      Map<String, dynamic> toMap() {
    
        return {
          'fullname': fullname,
          'city': city,
          'country': country,
          'address': address,
        };
      }
    
      factory Client.fromJson(Map<String, dynamic> json) {
        return Client(
            fullname: json['fullname'],
            city: json['city'],
            country: json['country'],
            address: json['address']
        );
      }
    }

    //New client
    Client newClient  = Client(
        fullname: "TINA K. Arouna",
        city: "Abidjan",
        country: "Côte d'ivoire",
        address: "Cocody angré - xcodevs corporation"
      );
    
    make.db.insert('client',newClient.toMap())
```
## Futures

09 basiques functions in French and English version

- xcAdd () or xcAjoute() : adding an entity
- xcReadFirst() or xcLitPremier() : Read first row in table
- xcReadLast() or xcLitDerneir() : Read last row in table
- xcModify() or xcModifie() : Modify current entity
- xcDelete() or xcSupprime() : Delete current entity
- xcDeleteAll() or xcSupprimeTout() : Delete all entity
- xcFind() or xcTrouve() : Seach in entity
- xcReadNext() or xcLitSuivant() : Read next row
- xcReadPrevious() or xcPrecedent() : Read previous row