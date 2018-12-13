
# coding: utf-8

# In[434]:


#Import data for different countries around the globe

import csv 
with open('C:\python\\site2.csv') as csvDataFile:
    csvReader = csv.reader(csvDataFile)
    for row in csvReader:
        print(row)


# In[435]:


##Put the resulting output into a dataset using Pandas

import pandas as pd 
data = pd.read_csv('C:\python\\site2.csv', sep=',', encoding='ISO-8859-1') 

# extract from the dataset the columns necessary for this study
## "copy"To avoid the case where changing df1 also changes df
data1 = data.iloc[0:183,[0,2,3,5]].copy()


print(data)


    




# In[436]:


#rename columns 

data1 = data.rename(columns={'Population': 'pop'})
data1 = data.rename(columns={'3-year (prop.)': '5-year (prop.)'})


data2 = data1[["Population","Quality*","Incidence","5-year (prop.)"]]

dataf = data2.rename(columns={'Quality*': 'Inci'})


dataff = dataf.rename(columns={'Incidence': '1-year (prop.)'})
dataff


# In[437]:


#deleting the last two columns
d = dataff.drop(dataff.columns[[4]], axis=1) 
d


# In[438]:


#selection from the previous dataset the desired countries for the study using their names

dd = d.loc[d.index.isin(['Bulgaria','Belgium','Switzerland','United Kingdom'])]
print (dd)




# In[439]:


data_prev = dd.rename(columns={'1-year (prop.)': 'prop1'})
data_prev


# In[440]:


#import the table of population

import csv
 
with open('C:\python\\population.csv') as csvDataFile:
    csvReader = csv.reader(csvDataFile)
    for row in csvReader:
        print(row)


# In[441]:


import pandas as pd

data_pop = pd.read_csv('C:\python\\population.csv', skiprows=3 , sep=';')
print(data_pop)


# In[445]:


# To avoid the case where changing data1_pop also changes data_pop
data1_pop = data_pop.iloc[0:231,[0,2]].copy()
print(data1_pop)





# In[449]:


#Put Country as an index column
data1_pop.reset_index(inplace = True)
data1_pop.set_index("Country", inplace = True)
data1_pop 


# In[450]:


# With isin() Methods , just select the countries you want for the study !
df2 = data1_pop.loc[data1_pop.index.isin(['Bulgaria','Belgium','Switzerland','United Kingdom'])]
print (dd)


# In[453]:


#df2 = data1_pop.iloc[[20,31,197,214],:].copy()
#df3 = df2.rename(columns={'Population': 'pop_total'})
#print(df3)


# In[454]:


europe


# In[455]:


df3


# In[463]:


#concatenation of the two parts of our dataset
concat_dataf = pd.DataFrame(columns=[ df3.index, europe.Inci, europe.prop1, df3.pop_total ])
concat_dataf


# In[464]:


#do the transposed for a better reading of the dataset
final = concat_dataf.transpose()
final 


# In[468]:


#change the reading of the elements of the list

incidence = ['10337', '3928', '5750', '52399']
incidence
nums = [int(x) for x in incidence]
nums



# In[469]:


#change the reading of the elements of the list
prev_en_chiff = ['9308', '3472','5270', '46182']
prev_en_chiff
num = [int(y) for y in proportion1]
num


# In[479]:


# change the reading of the elements of the list
population = ['10379067', '7385367','7523934', '60609153']
population 

numss = [int(y) for y in population]
numss


# In[480]:


#Calculation of prevalence

for i in range(0,4):
    x = (num[i]/numss[i])*100
    print (country[i], "%.3f" %x)
    
#No need to break !  


# In[481]:


prev_percentage = ['0.090', '0.047','0.070', '0.076']
prev_percentage
n = [float(y) for y in prev_percentage ]
n


# In[482]:


import numpy as np
col_vec = np.array(n, ndmin=1)
col_vec 


# In[475]:


concat_dataf.loc["prevalence"] = col_vec 
concat_dataf


# In[483]:


#the type of encoding should be specified 
concat_dataf.to_csv('C:/python//export1.csv', index=True, header=True, encoding='utf-8-sig')


# In[484]:


affiche =  concat_dataf.transpose()
affiche


# In[485]:


#to know the descriptive stats related to prevalence 
affiche.describe()


# In[ ]:


# The default seperator is ','
#the type of encoding should be specified 
affiche.to_csv('C:/python//export2.csv',index=True, header=True, encoding='utf-8-sig')  

    








# In[ ]:


# The default seperator is ','
#the type of encoding should be specified 
affiche.to_csv('C:/python//e2.csv',index=True, header=True, encoding='utf-8-sig')

