# -*- coding: utf-8 -*-

rank = Unirole::Rank.create!(seq: 10, name: '处级')
snqk = Unirole::Organ.create!(name: '蜀南气矿', rank: rank, parent: nil)

r2 = Unirole::Rank.create!(seq: 20, name: '科级')
Unirole::Organ.create!(name: '开发科', rank: r2, parent: snqk)
Unirole::Organ.create!(name: '安全科', rank: r2, parent: snqk)
Unirole::Organ.create!(name: '保卫科', rank: r2, parent: snqk)
