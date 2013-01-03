#!/bin/env ruby
# encoding: utf-8
Admin.create!(:email => 'admin@course.by', :password => 'admin')
u = User.create!(:nickname => 'Outcast', :email => 'philip.daineka@gmail.com', :password => 'fuckme')
p = u.problems.create!(:name => "Пабудаваць беларускамоўны садок", :description => "У нашым горадзе вельмі не хапае
беларускамоўных дзіцячых садкоў. \n У чэрвені 2009 года ў «Настаўніцкай газеце» быў апублікаваны артыкул
 «Дашкольная адукацыя на беларускай мове. Цалкам магчыма, але…» (78 ад 23 чэрвеня 2009 г.). Яго аўтар,
Дар’я Каткоўская, расказвала пра складанасці, з якімі сутыкнулася яе сям’я пры ўладкаванні сына Алеся ў
беларускамоўную групу ў адным са сталічных дзіцячых садоў. Нагадаем: бацькі хацелі, каб іх дзіця
набывала дашкольную адукацыю на беларускай мове. Аднак нечакана для маладых людзей працэс афармлення
сына ў дзіцячы сад зацягнуўся на некалькі месяцаў.")
p.comments.create!(:body => "Ja kahaju tsiabie, Maryna", :user => u)
u2 = User.create!(:nickname => 'Some user', :email => 'some.user@hl.com', :password => 'fuckme')
p.comments.create!(:body => "Я лічу такая праблема існуе! \n Трэба вырашаць!", :user => u2)
p2 = u2.problems.create!(:name => "Пабудаваць веганскую кавярню", :description => "Я веган.\n Я ня ем мяса. І я лічу што
нас такіх у Менску шмат - таму прапаноўваю падудаваць веганскую кавярню.\n Трэба гэта рабіць хутчэй!")
p2.comments.create!(:body => "Я лічу такая праблема існуе! \n Ты маеш рацыю!", :user => u)
p2.comments.create!(:body => "Дзякуй Outcast!", :user => u2)
u.payments.create(:amount => 100, :card => '1234567812345678')
u2.payments.create(:amount => 50, :card => '1134567812345678')
u2.payments.create(:amount => 30, :card => '1134567842345678')
u.payments.create(:amount => 20, :card => '1134567842345678')
u2.payments.create(:amount => 50, :card => '1134567812345678')
u2.payments.create(:amount => 150, :card => '1880018181810101')