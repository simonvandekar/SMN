students = c('Danni', 'Haozheng', 'Kaixing', 'Ningkun', 'Laura', 'Xin', 'Zongyue', 'Shuai', 'Yisu')

sites = read.table(file = 'data/RBC/sites.txt', sep = '/', header = FALSE, col.names=c('subject', 'site'))

# match students roughly equal number of subjects ensuring they are only assigned subjects from one site
sites = sites[ order(sites$site),]
# number of participants assigned per student
nsub = floor((nrow(sites) -sum(grepl('CUNY', sites$site)))/length(students))

sites$student = c(rep(students[1:4], each=nsub), rep('Simon',nrow(sites) - nsub*length(students)), rep(students[5:9], each=nsub))
sites[grepl('CUNY', sites$site), 'student'] = NA
table(sites$student, sites$site)
write.table(sites, file = '3first-level_analysis/homework/first-level_analysis/subject_assignment.csv', sep = ',', row.names = FALSE, quote=FALSE)