sig Dept {}
sig User {
  depts: some Dept,
  reads: set Doc
}
sig Doc {
  owner: one User,
  dept:  one Dept
}

fact R1 {
  all u: User, d: u.reads |
    d.dept in u.depts or d.owner = u
}

pred crossRead[u: User, d: Doc] {
  d in u.reads
  d.dept not in u.depts
}

run crossRead for 3
run { some u: User, d: Doc |
  crossRead[u, d] } for 3
