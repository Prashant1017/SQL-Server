--		Fulltext Search In SQL Server		--


select * from Production.ProductDescription


select * from Production.ProductDescription
where freetext (Description, 'alloy cups')


select * from Production.ProductDescription
where contains (Description, 'alloy or cup')


select * from Production.ProductDescription
where contains (Description, 'bike and delivers')


select * from Production.ProductDescription
where contains (Description, 'near((aluminum, cups), 10)')


select * from Production.ProductDescription
where contains (Description, '"deli*"')


select * from Production.ProductDescription
where contains (Description, 'formsof(thesaurus, "large")')


select * from Production.ProductDescription
where contains (Description, 'formsof(thesaurus, "race") and formsof(thesaurus, "bike")')
