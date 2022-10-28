import random
import datetime
import mysql.connector as mysqlpy

user = 'root'
password = 'example'
host = 'localhost'
port = '3307'
database = 'binomontron'

bdd = mysqlpy.connect(user=user, password=password, host=host, port=port, database=database)
cursor = bdd.cursor()

request="select * from eleves"

cursor.execute(request)
liste=[]
for i in cursor:
    liste.append(i[1])
t=len(liste)
n=2
nombre_groupe=int(t/n)
liste_finale=[]
liste_temporaire=[]
while t>0:
    i=0
    while i<n and t>0:
        a=random.choice(liste)
        liste_temporaire.append(a)
        liste.remove(a)
        i=i+1
        t=t-1
    liste_finale.append(liste_temporaire)
    liste_temporaire=[]

for i in range(len(liste_finale)):
    for j in range(len(liste_finale[i])):
        a=liste_finale[i][j]
        b=i+1
        c=datetime.date.today()
        quest = f"INSERT INTO eleve_groupe(id_eleves, id_groupes, date) VALUES('{a}', '{b}', '{c}')"
        cursor.execute(quest)






    
    


    


bdd.commit()
cursor.close()
bdd.close()