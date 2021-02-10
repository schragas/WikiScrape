from bs4 import BeautifulSoup
import requests

html_text = requests.get('https://en.wikipedia.org/wiki/2018_Winter_Olympics_medal_table').text
#Receives data from URL
soup = BeautifulSoup(html_text, 'lxml')
#Initiates BeautifulSoup as variable named 'soup'
medals = soup.find('table', class_ = 'wikitable sortable plainrowheaders jquery-tablesorter')



for team in medals.find_all('tbody'):
    
    rows = medals.find_all('tr')
    
    #header is not needed. Neither are the totals at the bottom so they are left out. 
    for row in rows[1:31]:
        #conditional for length of row is put in place in case of a rowspan tag because it decreases the amount of elements in a row from 6 to 5
        if len(row) < 6:
            row.insert(0,rank)
            country = row.find('a').text
            gold = row.find_all('td', class_=None)[0].text
            silver =row.find_all('td', class_=None)[1].text
            bronze =row.find_all('td', class_=None)[2].text
            total =row.find_all('td', class_=None)[3].text
            print (rank,country,gold,silver,bronze,total)
        
            

        else:
            rank = row.find_all('td', class_=None)[0].text
            country = row.find('a').text
            gold = row.find_all('td', class_=None)[1].text
            silver =row.find_all('td', class_=None)[2].text
            bronze =row.find_all('td', class_=None)[3].text
            total =row.find_all('td', class_=None)[4].text
            print (rank,country,gold,silver,bronze,total)
        


