
30.times do
    article = Article.new(summary:Faker::Lorem.paragraphs.join('. '),
		                    headline:Faker::Lorem.unique.sentences.join('. '),
							body:Faker::Lorem.paragraph,
							conclusion: Faker::Lorem.sentences.join('. '),
							ticker: Faker::Lorem.sentences.join('. '))
    if article.save
    	article.friendly_id = article.headline.gsub(/\s/, '-')
        article.save
    end
end