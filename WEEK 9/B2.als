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

assert OwnerOnlyCross {
  all u: User, d: u.reads |
    d.dept not in u.depts
      implies d.owner = u
}
check OwnerOnlyCross for 5
