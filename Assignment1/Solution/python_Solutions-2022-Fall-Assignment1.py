## Python data for schemas and instances for assignment 1
## Populate date with named tuples 


# Student(sid: integer, sname: text, homeCity: text)

Student = [
 {'sid' : 1001, 'sname' : 'Jean', 'homeCity' : 'Cupertino'},
 {'sid' : 1002, 'sname' : 'Vidya', 'homeCity' : 'Cupertino'},
 {'sid' : 1003, 'sname' : 'Anna', 'homeCity' : 'Seattle'},
 {'sid' : 1004, 'sname' : 'Qin', 'homeCity' : 'Seattle'},
 {'sid' : 1005, 'sname' : 'Megan', 'homeCity' : 'MountainView'},
 {'sid' : 1006, 'sname' : 'Ryan', 'homeCity' : 'Chicago'},
 {'sid' : 1007, 'sname' : 'Danielle', 'homeCity' : 'LosGatos'},
 {'sid' : 1008, 'sname' : 'Emma', 'homeCity' : 'Bloomington'},
 {'sid' : 1009, 'sname' : 'Hasan', 'homeCity' : 'Bloomington'},
 {'sid' : 1010, 'sname' : 'Linda', 'homeCity' : 'Chicago'},
 {'sid' : 1011, 'sname' : 'Nick', 'homeCity' : 'MountainView'},
 {'sid' : 1012, 'sname' : 'Eric', 'homeCity' : 'Cupertino'},
 {'sid' : 1013, 'sname' : 'Lisa', 'homeCity' : 'Indianapolis'},
 {'sid' : 1014, 'sname' : 'Deepa', 'homeCity' : 'Bloomington'},
 {'sid' : 1015, 'sname' : 'Chris', 'homeCity' : 'Denver'},
 {'sid' : 1016, 'sname' : 'YinYue', 'homeCity' : 'Chicago'},
 {'sid' : 1017, 'sname' : 'Latha', 'homeCity' : 'LosGatos'},
 {'sid' : 1018, 'sname' : 'Arif', 'homeCity' : 'Bloomington'},
 {'sid' : 1019, 'sname' : 'John', 'homeCity' : 'NewYork'}]


# Department(deptName: text, mainOffice: text)

Department = [
 {'deptName' : 'CS', 'mainOffice' : 'LuddyHall'},
 {'deptName' : 'DataScience', 'mainOffice' : 'LuddyHall'},
 {'deptName' : 'Mathematics', 'mainOffice' : 'RawlesHall'},
 {'deptName' : 'Physics', 'mainOffice' : 'SwainHall'},
 {'deptName' : 'Biology', 'mainOffice' : 'JordanHall'},
 {'deptName' : 'Chemistry', 'mainOffice' : 'ChemistryBuilding'},
 {'deptName' : 'Astronomy', 'mainOffice' : 'SwainHall'}]



# Major(major: text)

Major = [
 {'major' : 'CS'},
 {'major' : 'DataScience'},
 {'major' : 'Physics'},
 {'major' : 'Chemistry'},
 {'major' : 'Biology'}
]    


# employedBy(sid: integer,deptName:text,salary:integer)

employedBy = [ {'sid' : 1001, 'deptName' : 'CS', 'salary' : 65000},
 {'sid' : 1002, 'deptName' : 'CS', 'salary' : 45000},
 {'sid' : 1003, 'deptName' : 'DataScience', 'salary' : 55000},
 {'sid' : 1004, 'deptName' : 'DataScience', 'salary' : 55000},
 {'sid' : 1005, 'deptName' : 'Mathematics', 'salary' : 60000},
 {'sid' : 1006, 'deptName' : 'DataScience', 'salary' : 55000},
 {'sid' : 1007, 'deptName' : 'Physics', 'salary' : 50000},
 {'sid' : 1008, 'deptName' : 'DataScience', 'salary' : 50000},
 {'sid' : 1009, 'deptName' : 'CS', 'salary' : 60000},
 {'sid' : 1010, 'deptName' : 'DataScience', 'salary' : 55000},
 {'sid' : 1011, 'deptName' : 'Mathematics', 'salary' : 70000},
 {'sid' : 1012, 'deptName' : 'CS', 'salary' : 50000},
 {'sid' : 1013, 'deptName' : 'Physics', 'salary' : 55000},
 {'sid' : 1014, 'deptName' : 'CS', 'salary' : 50000},
 {'sid' : 1015, 'deptName' : 'DataScience', 'salary' : 60000},
 {'sid' : 1016, 'deptName' : 'DataScience', 'salary' : 55000},
 {'sid' : 1017, 'deptName' : 'Physics', 'salary' : 60000},
 {'sid' : 1018, 'deptName' : 'CS', 'salary' : 50000},
 {'sid' : 1019, 'deptName' : 'Biology', 'salary' : 50000}
]

# departmentLocation(deptName:text, building:text)

departmentLocation = [
 {'deptName' : 'CS', 'building' : 'LindleyHall'},
 {'deptName' : 'DataScience', 'building' : 'LuddyHall'},
 {'deptName' : 'DataScience', 'building' : 'Kinsey'},
 {'deptName' : 'DataScience', 'building' : 'WellsLibrary'},
 {'deptName' : 'Mathematics', 'building' : 'RawlesHall'},
 {'deptName' : 'Physics', 'building' : 'SwainHall'},
 {'deptName' : 'Physics', 'building' : 'ChemistryBuilding'},
 {'deptName' : 'Biology', 'building' : 'JordanHall'},
 {'deptName' : 'CS', 'building' : 'LuddyHall'},
 {'deptName' : 'Mathematics', 'building' : 'SwainHall'},
 {'deptName' : 'Physics', 'building' : 'RawlesHall'},
 {'deptName' : 'Biology', 'building' : 'MultiDisciplinaryBuilding'},
 {'deptName' : 'Chemistry', 'building' : 'ChemistryBuilding'}]



# studentMajor(sid:integer, major:text)

studentMajor = [
 {'sid' : 1001, 'major' : 'CS'},
 {'sid' : 1001, 'major' : 'DataScience'},
 {'sid' : 1002, 'major' : 'CS'},
 {'sid' : 1002, 'major' : 'DataScience'},
 {'sid' : 1004, 'major' : 'DataScience'},
 {'sid' : 1004, 'major' : 'CS'},
 {'sid' : 1005, 'major' : 'DataScience'},
 {'sid' : 1005, 'major' : 'CS'},
 {'sid' : 1005, 'major' : 'Physics'},
 {'sid' : 1006, 'major' : 'CS'},
 {'sid' : 1006, 'major' : 'Chemistry'},
 {'sid' : 1007, 'major' : 'Chemistry'},
 {'sid' : 1007, 'major' : 'CS'},
 {'sid' : 1009, 'major' : 'Chemistry'},
 {'sid' : 1009, 'major' : 'Physics'},
 {'sid' : 1010, 'major' : 'Physics'},
 {'sid' : 1011, 'major' : 'Physics'},
 {'sid' : 1011, 'major' : 'Chemistry'},
 {'sid' : 1011, 'major' : 'DataScience'},
 {'sid' : 1011, 'major' : 'CS'},
 {'sid' : 1012, 'major' : 'DataScience'},
 {'sid' : 1012, 'major' : 'Chemistry'},
 {'sid' : 1012, 'major' : 'CS'},
 {'sid' : 1013, 'major' : 'CS'},
 {'sid' : 1013, 'major' : 'DataScience'},
 {'sid' : 1013, 'major' : 'Chemistry'},
 {'sid' : 1013, 'major' : 'Physics'},
 {'sid' : 1014, 'major' : 'Chemistry'},
 {'sid' : 1014, 'major' : 'DataScience'},
 {'sid' : 1014, 'major' : 'Physics'},
 {'sid' : 1015, 'major' : 'CS'},
 {'sid' : 1015, 'major' : 'DataScience'},
 {'sid' : 1016, 'major' : 'Chemistry'},
 {'sid' : 1016, 'major' : 'DataScience'},
 {'sid' : 1017, 'major' : 'Physics'},
 {'sid' : 1017, 'major' : 'CS'},
 {'sid' : 1018, 'major' : 'DataScience'},
 {'sid' : 1019, 'major' : 'Physics'}
]


# hasFriend(sid1:integer, sid2:integer)

hasFriend = [
 {'sid1' : 1001, 'sid2' : 1008},
 {'sid1' : 1001, 'sid2' : 1012},
 {'sid1' : 1001, 'sid2' : 1014},
 {'sid1' : 1001, 'sid2' : 1019},
 {'sid1' : 1002, 'sid2' : 1001},
 {'sid1' : 1002, 'sid2' : 1002},
 {'sid1' : 1002, 'sid2' : 1011},
 {'sid1' : 1002, 'sid2' : 1014},
 {'sid1' : 1002, 'sid2' : 1015},
 {'sid1' : 1003, 'sid2' : 1004},
 {'sid1' : 1004, 'sid2' : 1002},
 {'sid1' : 1004, 'sid2' : 1003},
 {'sid1' : 1004, 'sid2' : 1012},
 {'sid1' : 1004, 'sid2' : 1013},
 {'sid1' : 1004, 'sid2' : 1014},
 {'sid1' : 1004, 'sid2' : 1019},
 {'sid1' : 1005, 'sid2' : 1015},
 {'sid1' : 1006, 'sid2' : 1003},
 {'sid1' : 1006, 'sid2' : 1004},
 {'sid1' : 1006, 'sid2' : 1006},
 {'sid1' : 1007, 'sid2' : 1008},
 {'sid1' : 1007, 'sid2' : 1013},
 {'sid1' : 1007, 'sid2' : 1016},
 {'sid1' : 1007, 'sid2' : 1017},
 {'sid1' : 1008, 'sid2' : 1001},
 {'sid1' : 1008, 'sid2' : 1007},
 {'sid1' : 1008, 'sid2' : 1015},
 {'sid1' : 1008, 'sid2' : 1019},
 {'sid1' : 1009, 'sid2' : 1001},
 {'sid1' : 1009, 'sid2' : 1005},
 {'sid1' : 1009, 'sid2' : 1013},
 {'sid1' : 1010, 'sid2' : 1008},
 {'sid1' : 1010, 'sid2' : 1013},
 {'sid1' : 1010, 'sid2' : 1014},
 {'sid1' : 1011, 'sid2' : 1005},
 {'sid1' : 1011, 'sid2' : 1009},
 {'sid1' : 1011, 'sid2' : 1010},
 {'sid1' : 1011, 'sid2' : 1011},
 {'sid1' : 1012, 'sid2' : 1011},
 {'sid1' : 1013, 'sid2' : 1002},
 {'sid1' : 1013, 'sid2' : 1007},
 {'sid1' : 1013, 'sid2' : 1018},
 {'sid1' : 1014, 'sid2' : 1005},
 {'sid1' : 1014, 'sid2' : 1006},
 {'sid1' : 1014, 'sid2' : 1012},
 {'sid1' : 1014, 'sid2' : 1017},
 {'sid1' : 1015, 'sid2' : 1002},
 {'sid1' : 1015, 'sid2' : 1003},
 {'sid1' : 1015, 'sid2' : 1005},
 {'sid1' : 1015, 'sid2' : 1011},
 {'sid1' : 1015, 'sid2' : 1015},
 {'sid1' : 1015, 'sid2' : 1018},
 {'sid1' : 1016, 'sid2' : 1004},
 {'sid1' : 1016, 'sid2' : 1006},
 {'sid1' : 1016, 'sid2' : 1015},
 {'sid1' : 1017, 'sid2' : 1013},
 {'sid1' : 1017, 'sid2' : 1014},
 {'sid1' : 1017, 'sid2' : 1019},
 {'sid1' : 1018, 'sid2' : 1004},
 {'sid1' : 1018, 'sid2' : 1007},
 {'sid1' : 1018, 'sid2' : 1009},
 {'sid1' : 1018, 'sid2' : 1010},
 {'sid1' : 1018, 'sid2' : 1013},
 {'sid1' : 1019, 'sid2' : 1001},
 {'sid1' : 1019, 'sid2' : 1006},
 {'sid1' : 1019, 'sid2' : 1008},
 {'sid1' : 1019, 'sid2' : 1013}
]

def print_Answer(L):  print("\n".join((str(x) for x in L)))  ## function to print elements of list one line at a time

def exists(L): return L != []

def ifThen(P,Q): return not P or Q

def student(sid, sname, homeCity): return {'sid':sid, 'sname': sname, 'homeCity': homeCity} in Student

def department(deptName, mainOffice): return {'deptName':deptName, 'mainOffice': mainOffice} in Department

def major(major): return {'major':major} in Major

def employedby(sid, deptName, salary): return {'sid':sid, 'deptName': deptName, 'salary': salary} in employedBy

def departmentlocation(deptName, building): return {'deptName':deptName, 'building': building} in departmentLocation

def studentmajor(sid,major): return {'sid':sid,'major':major} in studentMajor

def hasfriend(sid1,sid2): return {'sid1':sid1,'sid2':sid2} in hasFriend


# Problem 2
#select d.deptName, m.major
#from   department d, Major m
#where  true = some (select (s.sid, m.major) in (select * from studentMajor) and
#                           true = some (select w.sid = s.sid and 
#                                               w.deptName = d.deptName and w.salary >= 20000
#                                        from   employedBy w)
#                     from   Student s);



answer = [ {'deptname': d['deptName'], 'major': m['major']}
           for d in Department for m in Major
           if any ([studentmajor(s['sid'], m['major']) and
                    any([w['sid'] == s['sid'] and w['deptName'] == d['deptName'] and w['salary'] >= 20000
                         for w in employedBy])
          for s in Student])]


print(' ')
print_Answer(answer)
print(' ')





# 'Problem 3'
# Find each pair (s1,s2) of sids of different students who have the same
# (set of) friends who work for the CS department.


#select s1.sid as "sid1", s2.sid as "sid2"
#from   Student s1, Student s2
#where  true = all (select ((s1.sid,w.sid) in (select * from hasFriend) and
#                           (s2.sid,w.sid) in (select * from hasFriend)) OR
#                           ((s1.sid,w.sid) not in (select * from hasFriend) and
#                           (s2.sid,w.sid) not in (select * from hasFriend))
#                   from   employedBy w            
#                   where  w.deptName = 'CS') and
#       s1.sid <> s2.sid;


answer = [{'sid1': s1['sid'], 'sid2': s2['sid']}
 for s1 in Student for s2 in Student
 if all([(hasfriend(s1['sid'], w['sid']) and
          hasfriend(s2['sid'], w['sid']) ) or
         (not (hasfriend(s1['sid'],w['sid'])) and
          not (hasfriend(s2['sid'],w['sid'])))
         for w in employedBy
         if w['deptName'] == 'CS']) and
    s1['sid'] != s2['sid']
]


print(' ')
print_Answer(answer)
print(' ')


# 'Problem 4'
# Find each major for which there exists a student with that major and
# who does not only have friends who also have that major.

#select m.major
#from   Major m
#where  true = some (select (s1.sid,m.major) in (select * from studentMajor) and
 #                          (s1.sid,s2.sid) in (select * from hasFriend) and
 #                         (s2.sid,m.major) not in (select * from studentMajor)
 #                   from   Student s1, Student s2);

answer = [{'major':m['major']}
 for m in Major
 if any([studentmajor(s1['sid'],m['major']) and
         hasfriend(s1['sid'], s2['sid'])    and
         not (studentmajor(s2['sid'],m['major']))
         for s1 in Student for s2 in Student])
]



print(' ')
print_Answer(answer)
print(' ')



# 'Problem 13'

#select s1.sid, s1.sname
#from   Student s1
#where  true = any (select d.deptName = w.deptName and
#                          s1.sid = w.sid          and
#                          d.mainOffice = 'LuddyHall' and
#                          true = any (select (s1.sid, s2.sid) in (select * from hasFriend) and
#                                              s2.homeCity <> 'Bloomington'
#                                      from   Student s2)
#                   from   Department d, employedBy w);

## using 'any'

answer = [{'sid':s1['sid'], 'sname':s1['sname']}
 for s1 in Student
 if any ([d['deptName'] == w['deptName'] and
          s1['sid'] == w['sid']          and
          d['mainOffice'] == 'LuddyHall' and
          any ([hasfriend(s1['sid'],s2['sid']) and
                s2['homeCity'] != 'Bloomington'
                for s2 in Student
               ])
          for d in Department for w in employedBy])]
                  
print(' ')
print_Answer(answer)
print(' ')

## using 'exists'

answer = [{'sid':s1['sid'], 'sname':s1['sname']}
 for s1 in Student
 if exists ([1
             for d in Department for w in employedBy
             if d['deptName'] == w['deptName'] and
                s1['sid'] == w['sid']          and
                d['mainOffice'] == 'LuddyHall' and
                exists ([1
                         for s2 in Student
                         if hasfriend(s1['sid'],s2['sid']) and
                            s2['homeCity'] != 'Bloomington'])])]


print(' ')
print_Answer(answer)
print(' ')

## using 'in' and 'not in'


[{'sid':s1['sid'], 'sname':s1['sname']}
 for s1 in Student
 if s1['sid'] in [w['sid']
                for d in Department for w in employedBy
                if d['deptName'] == w['deptName'] and
                   d['mainOffice'] == 'LuddyHall' and
                   'Bloomington' not in [s2['homeCity']
                                       for s2 in Student
                                       if hasfriend(s1['sid'],s2['sid'])]]]


print(' ')
print_Answer(answer)
print(' ')



# 'Problem 14'

#select s1.sid 
#from   Student s1
#where  true = all (select true = some (select sm1.sid = s1.sid and
#                                              sm2.sid = s2.sid and
#                                              sm1.major = sm2.major and
#                                              sm1.sid <> sm2.sid
#                                       from   studentMajor sm1, studentMajor sm2)
#                   from   Student s2
#                   where  (s1.sid, s2.sid) in (select * from hasFriend));

# Using the conditional connective 'ifThen'

# using 'all' and 'any'

answer = [{'sid':s1['sid']}
for s1 in Student
if  all ([ifThen(hasfriend(s1['sid'],s2['sid']), any([sm1['sid'] == s1['sid'] and
                                                      sm2['sid'] == s2['sid'] and
                                                      sm1['major'] == sm2['major'] and
                                                      sm1['sid'] != sm2['sid']
                                                      for sm1 in studentMajor for sm2 in studentMajor]))
           for s2 in Student])]

print(' ')
print_Answer(answer)
print(' ')


# using 'not exists'


answer = [{'sid':s1['sid']}
for s1 in Student
if  not exists ([1
                for s2 in Student
                if hasfriend(s1['sid'],s2['sid']) and not exists ([1
                                                                   for sm1 in studentMajor for sm2 in studentMajor
                                                                   if sm1['sid'] == s1['sid'] and
                                                                      sm2['sid'] == s2['sid'] and
                                                                      sm1['major'] == sm2['major'] and
                                                                      sm1['sid'] != sm2['sid']])])]

print(' ')
print_Answer(answer)
print(' ')


# using 'not in'


answer = [{'sid':s1['sid']}
for s1 in Student
if  True not in [True
                 for s2 in Student
                 if hasfriend(s1['sid'],s2['sid']) and s2['sid'] not in [sm2['sid']
                                                                         for sm1 in studentMajor for sm2 in studentMajor
                                                                         if sm1['sid'] == s1['sid'] and
                                                                            sm1['major'] == sm2['major'] and
                                                                            sm1['sid'] != sm2['sid']]]]

print(' ')
print_Answer(answer)
print(' ')


## 'Problem 15'

#select s1.sid as "sid1", s2.sid as "sid2"
#from   Student s1, Student s2
#where  s1.sid <> s2.sid and
#       true = all (select true = some (select f2.sid1 = s2.sid and f1.sid2 = f2.sid2
#                                       from   hasFriend f2)
#                   from   hasFriend f1
#                   where  s1.sid = f1.sid1);


# using 'all' and 'any'

answer = [{'sid1':s1['sid'],'sid2':s2['sid']}
 for s1 in Student  for s2 in Student
 if  s1['sid'] != s2['sid'] and
     all([ifThen(s1['sid'] == f1['sid1'],any([f2['sid1'] == s2['sid'] and f1['sid2'] == f2['sid2']
                                              for f2 in hasFriend]))
          for f1 in hasFriend])]

print(' ')
print_Answer(answer)
print(' ')



# using 'not exists'

answer = [{'sid1':s1['sid'],'sid2':s2['sid']}
 for s1 in Student  for s2 in Student
 if  s1['sid'] != s2['sid'] and
     not exists ([1
                 for f1 in hasFriend
                 if s1['sid'] == f1['sid1'] and
                    not exists ([1
                                 for f2 in hasFriend
                                 if f2['sid1'] == s2['sid'] and f1['sid2'] == f2['sid2']])])]

print(' ')
print_Answer(answer)
print(' ')




# using 'not in'

answer = [{'sid1':s1['sid'],'sid2':s2['sid']}
 for s1 in Student  for s2 in Student
 if  s1['sid'] != s2['sid'] and
     s1['sid'] not in [f1['sid1']
                      for f1 in hasFriend
                      if  f1['sid2'] not in [f2['sid2']
                                           for f2 in hasFriend
                                           if f2['sid1'] == s2['sid']]]]
                                




       
print(' ')
print_Answer(answer)
print(' ')

# 'Problem 22.b'
# Some major has fewer than 2 students with that major.

#select true = some (select true = all (select s1.sid = s2.sid
#                                       from  Student s1, Student s2
#                                       where (s1.sid, m.major) in (select * from studentMajor) and
#                                             (s2.sid, m.major) in (select * from studentMajor))
#                    from Major m) as "constraintSatisfied";

answer = any([all([ifThen(studentmajor(s1['sid'],m['major']) and studentmajor(s2['sid'],m['major']), s1['sid'] == s2['sid'])
         for s1 in Student  for s2 in Student])
     for m in Major])

print(' ')
print(answer)
print(' ')


# 'Problem 23.b'
# Each student who works for a department has a friend who also works
# for that department and who earns the same salary

#select true = all (select true = some (select (w.sid,w1.sid) in (select * from hasFriend) and
#                                              (w1.sid, w1.salary) = (w.sid, w.salary)
#                                       from   employedBy w1)
#                   from  Student s, Department d, employedBy w
#                   where (w.sid,w.deptName) = (s.sid,d.deptName)) as "constraintSatisfied";;


answer = all([ifThen((w['sid'],w['deptName']) == (s['sid'],d['deptName']),any([hasfriend(w['sid'],w1['sid']) and
                                                                      (w1['deptName'],w1['salary']) == (w['deptName'],w['salary'])
                                                                      for w1 in employedBy
                                                                     ]
                                                                     ))
     for s in Student  for d in Department  for w in employedBy
    ])

print(' ')
print(answer)
print(' ')





# 'Problem 24.b'
# All students working in a same department share a major and earn the
# same salary.

#select true = all (select w1.salary = w2.salary and
#                          true = some (select (s1.sid,m.major) in (select * from studentMajor) and
#                                              (s2.sid,m.major) in (select * from studentMajor)
#                                       from   Major m)
#                   from   Student s1, Student s2, employedBy w1, employedBy w2
#                   where  (w1.sid,w1.deptName,w2.sid) = (s1.sid,w2.deptName,s2.sid))  as "constraintSatisfied";

answer = all([ifThen((w1['sid'],w1['deptName'],w2['sid']) == (s1['sid'],w2['deptName'],s2['sid']) ,
            w1['salary'] == w2['salary'] and
            any([studentmajor(s1['sid'],m['major']) and studentmajor(s2['sid'],m['major'])
                 for m in Major
            ]))
    for s1 in Student  for s2 in Student  for w1 in employedBy  for w2 in employedBy])


print(' ')
print(answer)
print(' ')





