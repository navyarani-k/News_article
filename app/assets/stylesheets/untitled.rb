article = Article.new(summary:Faker::Lorem.sentences,
                    headline:Faker::Lorem.unique.sentences,
					body:Faker::Lorem.paragraph,
					conclusion: Faker::Lorem.sentences,
					ticker: Faker::Lorem.sentences)
