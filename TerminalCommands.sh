sfdx force:mdapi:retrieve -s -r ./mdapipkg -u jlupton-xpnc@force.com -p TransactionSecurity
unzip ./mdapipkg/unpackaged.zip -d ./mdapipkg/source
sfdx force:mdapi:convert --rootdir mdapipkg/source


git init
git remote add origin https://github.com/luptongit/TransactionSecurityExamples.git
git add .
git commit -m "Initial Commit - Transaction Security with Apex and without"
git push -u origin master --force

sfdx force:org:create -f config/project-scratch-def.json -a TSExamples
sfdx force:org:open -u TSExamples
sfdx force:source:push -u TSExamples
sfdx force:source:pull -u TSExamples