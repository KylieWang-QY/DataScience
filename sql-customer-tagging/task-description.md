# Customer tagging task

***

## Project Background
A huge number of merchants, retailers, and consumers are interconnected on the Amazon e-commerce network. While experiencing tremendous user growth, it must also acquire risk management capabilities on the business side. Risks of an e-commerce platform include, but are not limited to, consumers, possible risk from different dimensions such as equipment and geographical location, and black and grey products that are regularly attacked. User growth and risk control capabilities are the two most important parts of our evaluation for this project, as well as the two fundamental indications we examine.

## Objectives
To analyze user transaction, business and behavioural features on the e-commerce platform, identify significant and differentiated characteristics, and write scripts for online calling policies, thereby enhancing the e-commerce risk control engine for fraudulent returns/swiping orders and black products. The capacity to recognise and cover attacks, as well as to characterise the user growth pattern of e-commerce platforms.

## Steps. drive table
Typical, the following processes will be used to clean a table and obtain the drive table, also known as record table, containing black and white samples (corresponding to positive and negative samples). We are dealing with a binary classification problem in this case. Postive and negative classes are represented by black and white, respectively. As labels are central to the classification problem, we build a drive table by labelling them.

1. Pick out black samples：
    - Period between 20191201 to 20200331
2. Pick out white samples：
    - Period between 20191201 to 20200331
3. Count the row of numbers of black/white samples, and sample the white samples
4. Label the black and white events to obtain the drive table 
    - the fields in the drive table include all of the transaction information and labelled fields of the black/white samples

## Tables
|  Table   | Description  | Key  |
|  ----  | ----  | ----  |
| account_all  | transaction infromation of the e-commerce platform | userid |
| account_black  | blacklist table on the business side | event_id |