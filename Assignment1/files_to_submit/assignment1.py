# Python data for schemas and instances for assignment 1


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

# You can use the following Python functions

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

# Utility
def DISTINCT(R): return [R[i] for i in range(0, len(R)) if R[i] not in R[i+1:]]
def exists(R): return R != []
def ALL(R): return all(R)
def some(R): return any(R)

# Problem 2
# Find each pair (d, m) where d is the name of a department and m is a
# major of a student who is employed by that department and who earns a
# salary of at least 20000.

DISTINCT([{'deptName': e['deptName'], 'major': m['major']} for m in studentMajor for e in [{'sid': e1['sid'],'deptName': e1['deptName']}for e1 in employedBy if e1['salary']>=20000] if m['sid'] == e['sid']])

# 'Problem 3'
# Find each pair (s1,s2) of sids of different students who have the same
# (set of) friends who work for the CS department.

[{'sid': s1['sid'], 'sid2': s2['sid']} for s1 in Student for s2 in Student if s1['sid']!=s2['sid'] and all([
  ((s2['sid'], s3['sid']) in [(f['sid1'], f['sid2']) for f in hasFriend]) for s3 in Student for e1 in employedBy if ((s1['sid'], s3['sid']) in [(f['sid1'], f['sid2']) for f in hasFriend] and s3['sid']==e1['sid'] and e1['deptName']=='CS')
]) and all([
  ((s1['sid'], s4['sid']) in [(f['sid1'], f['sid2']) for f in hasFriend]) for s4 in Student for e2 in employedBy if ((s2['sid'], s4['sid']) in [(f['sid1'], f['sid2']) for f in hasFriend] and s4['sid']==e2['sid'] and e2['deptName']=='CS')
])]

# 'Problem 4'
# Find each major for which there exists a student with that major and
# who does not only have friends who also have that major.

DISTINCT([{'major':A['major']} for A in studentMajor for B in hasFriend for C in studentMajor if A['sid']==B['sid1'] and B['sid2']==C['sid'] and A['major']!=C['major']])

# 'Problem 13'

[{'sid': s1['sid'], 'sname': s1['sname']} for s1 in Student if True == some([
  d['deptName']==w['deptName'] and s1['sid']==w['sid'] and d['mainOffice'] == 'LuddyHall' for d in Department for w in employedBy if True == some([
    [s2['homeCity'] != 'Bloomington'] for s2 in Student for h in hasFriend if h['sid1'] == s1['sid'] and h['sid2']==s2['sid']
  ])
])]

# Using in clause instead of true = some
[{'sid': s1['sid'], 'sname': s1['sname']} for s1 in Student if 'LuddyHall' in ([
  d['mainOffice'] for d in Department for w in employedBy if  d['deptName']==w['deptName'] and s1['sid']==w['sid'] and True == some([
    [s2['homeCity'] != 'Bloomington' for s2 in Student for h in hasFriend if h['sid1'] == s1['sid'] and h['sid2']==s2['sid']]
  ])
])]

# ′true = some′≡ ′exists′
[{'sid': s1['sid'], 'sname': s1['sname']} for s1 in Student if exists ([
  1 for d in Department for w in employedBy if  d['deptName']==w['deptName'] and s1['sid']==w['sid'] and d['mainOffice'] == 'LuddyHall' and exists([
    [1 for s2 in Student for h in hasFriend if h['sid1'] == s1['sid'] and h['sid2']==s2['sid'] and s2['homeCity'] != 'Bloomington']
  ])
])]

# 'Problem 14'
[{'sid': s1['sid']} for s1 in Student if True == ALL([
  True == some([
    sm1['sid'] == s1['sid'] and sm2['sid']==s2['sid'] and sm1['major']==sm2['major'] and sm1['sid']!=sm2['sid'] for sm1 in studentMajor for sm2 in studentMajor
  ]) for s2 in Student if ((s1['sid'], s2['sid']) in [(f['sid1'], f['sid2']) for f in hasFriend])
])]

# P → Q ≡ ¬P ∨Q
[{'sid': s1['sid']} for s1 in Student if True == ALL([
  ((s1['sid'], s2['sid']) not in [(f['sid1'], f['sid2']) for f in hasFriend]) or True == some([
    sm1['sid'] == s1['sid'] and sm2['sid']==s2['sid'] and sm1['major']==sm2['major'] and sm1['sid']!=sm2['sid'] for sm1 in studentMajor for sm2 in studentMajor
  ]) for s2 in Student
])]

# ∀t ∈R (P →Q) ≡ ¬∃t ∈R (P ∧ ¬Q)

[{'sid': s1['sid']} for s1 in Student if not exists([
  1 for s2 in Student if ((s1['sid'], s2['sid']) in [(f['sid1'], f['sid2']) for f in hasFriend]) and not True == some([
    sm1['sid'] == s1['sid'] and sm2['sid']==s2['sid'] and sm1['major']==sm2['major'] and sm1['sid']!=sm2['sid'] for sm1 in studentMajor for sm2 in studentMajor
  ])
])]

# 'Problem 15'
[{'sid1': s1['sid'], 'sid2': s2['sid']} for s1 in Student for s2 in Student if s1['sid'] != s2['sid'] and True == ALL([
  True == some([
    f2['sid1']==s2['sid'] and f1['sid2'] == f2['sid2'] for f2 in hasFriend
  ]) for f1 in hasFriend if s1['sid'] == f1['sid1']
])]

# P → Q ≡ ¬P ∨Q
[{'sid1': s1['sid'], 'sid2': s2['sid']} for s1 in Student for s2 in Student if s1['sid'] != s2['sid'] and True == all([
  s1['sid'] != f1['sid1'] or True == some([
    f2['sid1']==s2['sid'] and f1['sid2'] == f2['sid2'] for f2 in hasFriend
  ]) for f1 in hasFriend
])]

# ∀t ∈R (P →Q) ≡ ¬∃t ∈R (P ∧ ¬Q)
[{'sid1': s1['sid'], 'sid2': s2['sid']} for s1 in Student for s2 in Student if (not exists([
  1 for f1 in hasFriend if s1['sid'] == f1['sid1'] and not True == some([
    f2['sid1']==s2['sid'] and f1['sid2'] == f2['sid2'] for f2 in hasFriend
  ])
])) and s1['sid'] != s2['sid']]


# 'Problem 22.c'
# Some major has fewer than 2 students with that major.
True == some([
  (not True == some([
    sm1['sid'] == s1['sid'] and sm1['major'] == m['major'] for s1 in Student for sm1 in studentMajor
  ])) or (True == some([
    sm2['sid'] == s2['sid'] and sm2['major'] == m['major'] and not True == some([
      sm2['sid'] != s2['sid'] and sm3['sid'] == s3['sid'] and sm2['major'] == m['major'] for s3 in Student for sm3 in studentMajor
    ]) for s2 in Student for sm2 in studentMajor
  ])) for m in Major
])

# 'Problem 23.b'
# Each student who works for a department has a friend who also works
# for that department and who earns the same salary
True == all([
  True == some([
    ((s['sid'], s1['sid']) in ((f['sid1'], f['sid2']) for f in hasFriend)) and s['sid'] != s1['sid'] and e1['sid']==s1['sid'] and e1['salary']==e['salary'] and e1['deptName']==e['deptName'] for s1 in Student for e1 in employedBy
  ]) for s in Student for e in employedBy if s['sid'] == e['sid']
])


# 'Problem 24.b'
# All students working in a same department share a major and earn the
# same salary.
True == all([
  True == all([
    e1['salary']==e1['salary'] and sm1['major']==sm2['major'] for s2 in Student for e2 in employedBy for sm2 in studentMajor if s1['sid']!=s2['sid'] and s2['sid']==e2['sid'] and sm2['sid']==s2['sid'] and e2['deptName']==e1['deptName']
  ]) for s1 in Student for e1 in employedBy for sm1 in studentMajor if s1['sid']==e1['sid'] and sm1['sid']==s1['sid']
])



