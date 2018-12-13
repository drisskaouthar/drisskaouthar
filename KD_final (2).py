
# coding: utf-8

# In[26]:


#Import data for different regions of the US

import csv 
with open('C:\python\\b.csv') as csvDataFile:
    csvReader = csv.reader(csvDataFile)
    for row in csvReader:
        print(row)


# In[27]:


#Put the resulting output into a dataset using Pandas

import pandas as pd
df = pd.read_csv('C:\python\\b.csv')
str00=df.Area
str0=df.CaseCount

# extract from the dataset the columns necessary for this study
## "copy"To avoid the case where changing df1 also changes df
df1 = df.iloc[0:50,[0,1,5,6]].copy()

print(df1)








# In[28]:


#Calculation of the prevalence
str1=(df.CaseCount/df.Population)*100
print(str1)

#Adding the prevalence column to the dataset
df2 = pd.concat([df1, pd.DataFrame(str1)], axis=1)

#The CaseCount column presents the incidence so it is better to rename it!
dff = df2.rename(columns={'CaseCount': 'Incidence'})
dff

#rename the calculated prevalence column
dff.rename(columns={list(dff)[4]:'prevalence'}, inplace=True)
dff


# In[29]:


#descriptive statistics
dff.describe()


# In[30]:


#Export to csv file
dff.to_csv('C:/python//export3.csv', index=False, header=True, encoding='utf-8')


# In[31]:


#Graphical visualization of the data
##Barplot of Incidence by region

from matplotlib import pyplot as plt
import matplotlib.pyplot as pls 
dff.plot(x='Area', y='Incidence', kind='bar') 
plt.show()



# In[32]:


##Barplot of prevalence by region 
from matplotlib import pyplot as plt
import matplotlib.pyplot as pls 
dff.plot(x='Area', y='prevalence', kind='bar') 
plt.show()

                          

                          




# In[33]:


# Pie plot 
import matplotlib.pyplot as plt
import numpy 
labels = ["Nevada", "Texas", "New Mexico", "Wyoming","Arizona","Arkansas","Mississippi","Oklahoma","Utah"]
sizes = numpy.array([0.124,0.114, 0.134,0.129,0.133,0.138,0.133,0.137,0.100])
colors = ['yellowgreen', 'gold', 'lightskyblue', 'lightcoral', 'red','blue','grey','orange','pink']
# explode 1st slice
explode = (0.1, 0, 0, 0)  

patches,texts = plt.pie(sizes)
plt.legend(patches, labels=['%s, %1.1f %%' % (l, s) for l, s in zip(labels, sizes)], loc="best")


patches,texts = plt.pie(shadow=True, startangle=140)

plt.tight_layout()
# Set aspect ratio to be equal so that pie is drawn as a circle.
plt.axis('equal')

plt.show()

