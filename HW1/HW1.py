import pandas as pd
import numpy as np
import datetime as dt
import matplotlib.pyplot as plt

plt.style.use('seaborn')
df = pd.read_stata('mroz_ps0.dta')
print(df[['wage','exper','educ','age','kidslt6','kidsge6']].describe().T.applymap('{:,.1f}'.format).to_latex())
df['lwage']= np.log(df['wage']+0.1)
plt.scatter(df['exper'], df['lwage'])
plt.xlabel('exper')
plt.ylabel('lwage')
plt.savefig("p5qc")

plt.scatter(df['exper'], df['lwage'])
plt.xlabel('exper')
plt.ylabel('lwage')
plt.savefig("p5qc")

import seaborn as sns
ax = sns.regplot(x="exper", y="lwage", data=df,line_kws= {'label':'linear fit','color':'r'})
plt.legend()
plt.savefig("p5qd")

ax = sns.regplot(x="exper", y="lwage", data=df,order=2, line_kws= {'label':'quadratic fit','color':'r'})
plt.legend()
plt.savefig("p5qe")
