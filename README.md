
# Data-Preprocessing-using-Distributed-Database

Purpose of Project
------------

In this world of big data, the amount of data stored is increasing day by day. Various machine learning algorithms are applied
to these huge datasets to create serviceable applications. But before feeding this datasets to machine learning models, its 
important to preprocess them and make it compatible for the machine learning models. This preprocessing can be computationally 
expensive. So, a possible solution to this problem can be to send the data to the remote clients where these data will be 
preprocessed. These data can then be read back by the main server. This technique relieves of some computational burden 
for the main server.

Description of Project
------------

This is a desktop application made using Oracle Database 10g. This project consists of 3 sites. One is the main server, and 2 client servers.
The client servers can be on a different computer. In the main server (my computer), the data is vertically fragmented into two categories. 
All the columns with that contained numercial values are sent to client 1 and all the columns that contains text/label data are sent to site 2. 
In each of these sites, different preprocessing techniques are applied. The data is preprocessed and can be feed to any machine learning models. 
The preprocessed data can be loaded back to the main server. 


- ***Project Goals***: 

  * Setting up commincation between server and client sites
  * Sending data back and forth between client and server
  * Vertically fragment data in the main server
  * Read data from the client server on the main sever
  * **Client 1 (Numerical values)**
    *   Filling missing values using  mean value
    *   Handling Outliers
    *   Min Max Scaler
    *   Standard Scaler
  * **Client 2 (Categorical values)**
    *   One hot Encoding
    *   Label Encoding
    *   Fill missing values with mode of that column
    *   Check if data contains any numerical values or not 
    
  
  * The users will be able to find parking areas easily, it will save a lot of fuel for them. It also reduces the chances of them being fined. This app will help car parking owners bring in more customers for them.

- ***Platform Details***: 

  * **Language** : PLSQL
  * **Database** : Oracle 10g Database
  * **Text-Editor** : Notepadd++


Future Implementations
---------------

- Incorporating more preprocessing techniques for both sites
- Apply machine learning algorithms

