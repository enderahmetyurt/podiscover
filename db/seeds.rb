# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

podcasts = [
  {:uid=>"2vJHmWhhcMQRXtTruuFWTJ", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Philosophy", "uri"=>"spotify:genre:0JQ5IMCbQBLjLJlIwYDak9"}]},
  {:uid=>"0eZnjoWx1z2gCTCjIzTSan", :genres=>[]},
  {:uid=>"2eZOTKreT10INezwYUN959", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Entertainment", "uri"=>"spotify:genre:entertainment_v2_podcasts"}]},
  {:uid=>"1VK6UsflwmkUe3XqVFcbbl", :genres=>[]},
  {:uid=>"5VctKd0UG0yPDEnnvr5FuZ", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Self-help", "uri"=>"spotify:genre:0JQ5DAqbMKFLPhtHltUeTr"}]},
  {:uid=>"4NaOYpBHF5WhPvoyRRTkxr", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Film", "uri"=>"spotify:genre:0JQ5IMCbQBLBylyI0RX5u8"}, {"__typename"=>"PodcastTopic", "title"=>"Entertainment", "uri"=>"spotify:genre:entertainment_v2_podcasts"}]},
  {:uid=>"6tDo6offekgrjoBJwDdZ6S", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Comedy", "uri"=>"spotify:genre:0JQ5DAqbMKFNr6gDrHHVKL"}]},
  {:uid=>"0smtIEnNmFN53ElvcmsKGy", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"0k8anB7xABN8rGAWSRjvwE", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Comedy", "uri"=>"spotify:genre:0JQ5DAqbMKFNr6gDrHHVKL"}]},
  {:uid=>"70QlYnLX3izDdFhlKfOaeF", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Stories", "uri"=>"spotify:genre:0JQ5DAqbMKFHv2c1dK1Jdi"}, {"__typename"=>"PodcastTopic", "title"=>"LGBTQIA+", "uri"=>"spotify:genre:0JQ5IMCbQBLqTWL5TpOn3z"}]},
  {:uid=>"5kcEHIj6RjVMTNBAx3ONVr", :genres=>[]},
  {:uid=>"1PbxcO4xVw4uVA4nZ72A9w", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"How-to", "uri"=>"spotify:genre:how_to_podcasts"}, {"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"2dR1MUZEHCOnz1LVfNac0j", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Business", "uri"=>"spotify:genre:0JQ5DAqbMKFK0EBNV8Wn6R"}]},
  {:uid=>"6toMKDQqEjeymzn1trHavd", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"History", "uri"=>"spotify:genre:0JQ5DAqbMKFKK9EFSCDuOS"}, {"__typename"=>"PodcastTopic", "title"=>"Comedy", "uri"=>"spotify:genre:0JQ5DAqbMKFNr6gDrHHVKL"}]},
  {:uid=>"2ZWP5DFc9TCCLdVIeGYscw", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"0mTDOAhdhka9gGpMI8kL4d", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Comedy", "uri"=>"spotify:genre:0JQ5DAqbMKFNr6gDrHHVKL"}]},
  {:uid=>"02fM1JHpt9HmHGp482K71b", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Society", "uri"=>"spotify:genre:0JQ5DAqbMKFLFBJyefzcxG"}, {"__typename"=>"PodcastTopic", "title"=>"Culture", "uri"=>"spotify:genre:0JQ5DAqbMKFP9ywiCs8qKW"}, {"__typename"=>"PodcastTopic", "title"=>"Careers", "uri"=>"spotify:genre:0JQ5DAqbMKFMnJvsZliRJL"}]},
  {:uid=>"2OwAg0ckS0mUDPi6HW8FNt", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Language", "uri"=>"spotify:genre:0JQ5DAqbMKFGvEvBJcLHVZ"}]},
  {:uid=>"3AA9buFn8oxJf8WSDOUks5", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Business", "uri"=>"spotify:genre:0JQ5DAqbMKFK0EBNV8Wn6R"}]},
  {:uid=>"6vH87E5CYyCOkB7NKu55dV", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"0bjRi7VkXARmvZl6ZnDPLS", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"2VNf2tvHIjSxTXMY15qtdV", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"7wI0tsKVBkoHyYvofNOWCe", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"How-to", "uri"=>"spotify:genre:how_to_podcasts"}, {"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"1tTuUApDgH6w1LZY25jmzG", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Business", "uri"=>"spotify:genre:0JQ5DAqbMKFK0EBNV8Wn6R"}, {"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"3CBMe6U1KxJeZ7u3BcKFtf", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"How-to", "uri"=>"spotify:genre:how_to_podcasts"}]},
  {:uid=>"0OgzwJ8BSYcjl61cRMttAf", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Business", "uri"=>"spotify:genre:0JQ5DAqbMKFK0EBNV8Wn6R"}]},
  {:uid=>"3GRJb6bwpKEbOOG7QFjRqS", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Language", "uri"=>"spotify:genre:0JQ5DAqbMKFGvEvBJcLHVZ"}, {"__typename"=>"PodcastTopic", "title"=>"Educational podcasts", "uri"=>"spotify:genre:educational_podcasts"}]},
  {:uid=>"1m5mwOtv9SZzDoXN7XmHCO", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"1qtSZ2xK4krw8YWcMwMR5g", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Business", "uri"=>"spotify:genre:0JQ5DAqbMKFK0EBNV8Wn6R"}]},
  {:uid=>"6TfsHyIhodDLavohgS7hN6", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"4xRYqkFbhVIBQfIrxl19e9", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Careers", "uri"=>"spotify:genre:0JQ5DAqbMKFMnJvsZliRJL"}]},
  {:uid=>"6aDwKoqXwAqAJTqwbrvL1P", :genres=>[]},
  {:uid=>"6IfxcFTt06DI5yqwLom3j0", :genres=>[]},
  {:uid=>"3a2NgHtu4nZayO2St7htC3", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Celebrities", "uri"=>"spotify:genre:0JQ5IMCbQBLwyf3yahCa0M"}, {"__typename"=>"PodcastTopic", "title"=>"TV", "uri"=>"spotify:genre:0JQ5IMCbQBLo64OouK01L3"}, {"__typename"=>"PodcastTopic", "title"=>"Entertainment", "uri"=>"spotify:genre:entertainment_v2_podcasts"}]},
  {:uid=>"5Zs59PqWJYL2kDEQvWeB2O", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Self-help", "uri"=>"spotify:genre:0JQ5DAqbMKFLPhtHltUeTr"}]},
  {:uid=>"4h6XpEbWnXnYECEXPBSm7M", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Society", "uri"=>"spotify:genre:0JQ5DAqbMKFLFBJyefzcxG"}, {"__typename"=>"PodcastTopic", "title"=>"Culture", "uri"=>"spotify:genre:0JQ5DAqbMKFP9ywiCs8qKW"}]},
  {:uid=>"19SHNADbSOqq3DCEkcNeRI", :genres=>[]},
  {:uid=>"76sdW7pWQXcPeRyQzUwcOF", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Marketing", "uri"=>"spotify:genre:0JQ5IMCbQBLjlqsYQ6tkLI"}]},
  {:uid=>"5hwEa9TUlYfCb4gzktEZdt", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Marketing", "uri"=>"spotify:genre:0JQ5IMCbQBLjlqsYQ6tkLI"}]},
  {:uid=>"6tvc3Ju4w1TtXr7gjgoy0Y", :genres=>[]},
  {:uid=>"6Y1STt6SGDnPc8AdDzGMzn", :genres=>[]},
  {:uid=>"1SK2Cikoj4KrVurKenU5eu", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Business", "uri"=>"spotify:genre:0JQ5DAqbMKFK0EBNV8Wn6R"}]},
  {:uid=>"7fvBlgg1Xuhe2hG0mlGKWg", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Society", "uri"=>"spotify:genre:0JQ5DAqbMKFLFBJyefzcxG"}, {"__typename"=>"PodcastTopic", "title"=>"Culture", "uri"=>"spotify:genre:0JQ5DAqbMKFP9ywiCs8qKW"}]},
  {:uid=>"4St1BjxYRx5jLmMv1oUgiQ", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Marketing", "uri"=>"spotify:genre:0JQ5IMCbQBLjlqsYQ6tkLI"}]},
  {:uid=>"7fN6ubruyMGooVcFdgW8ek", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"History", "uri"=>"spotify:genre:0JQ5DAqbMKFKK9EFSCDuOS"}]},
  {:uid=>"0lxYqvY1nAYsBJ4jTA2coG", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Food", "uri"=>"spotify:genre:0JQ5DAqbMKFNPUFuyD1Gs7"}]},
  {:uid=>"7afmLRSKgXPLKVpWoXbsrF", :genres=>[]},
  {:uid=>"2Bz4EgVlkhdbnErAPz408N", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Business", "uri"=>"spotify:genre:0JQ5DAqbMKFK0EBNV8Wn6R"}, {"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"1wIytRQ4Ub8McXSP1iDwVX", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Self-help", "uri"=>"spotify:genre:0JQ5DAqbMKFLPhtHltUeTr"}]},
  {:uid=>"6wrY0BWgAMu1VBNJkP6c1U", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Documentary", "uri"=>"spotify:genre:0JQ5DAqbMKFCWOPjGCVIq4"}, {"__typename"=>"PodcastTopic", "title"=>"Culture", "uri"=>"spotify:genre:0JQ5DAqbMKFP9ywiCs8qKW"}, {"__typename"=>"PodcastTopic", "title"=>"Philosophy", "uri"=>"spotify:genre:0JQ5IMCbQBLjLJlIwYDak9"}]},
  {:uid=>"59TuodoCkXRJmbdtKgqlH5", :genres=>[]},
  {:uid=>"6ctWG0smxjBMpH7n1yV5df", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Film", "uri"=>"spotify:genre:0JQ5IMCbQBLBylyI0RX5u8"}, {"__typename"=>"PodcastTopic", "title"=>"TV", "uri"=>"spotify:genre:0JQ5IMCbQBLo64OouK01L3"}]},
  {:uid=>"4EosrppuAq6ctTBmImrb1x", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Documentary", "uri"=>"spotify:genre:0JQ5DAqbMKFCWOPjGCVIq4"}, {"__typename"=>"PodcastTopic", "title"=>"Culture", "uri"=>"spotify:genre:0JQ5DAqbMKFP9ywiCs8qKW"}, {"__typename"=>"PodcastTopic", "title"=>"Personal stories", "uri"=>"spotify:genre:0JQ5DAqbMKFIHya0xgnxbE"}]},
  {:uid=>"5ECF0soZ1H5NxZHanAzUYd", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Relationships", "uri"=>"spotify:genre:0JQ5DAqbMKFIbOFW5Avg3a"}, {"__typename"=>"PodcastTopic", "title"=>"Philosophy", "uri"=>"spotify:genre:0JQ5IMCbQBLjLJlIwYDak9"}]},
  {:uid=>"76RzuTRRR6iVyOwreRYox3", :genres=>[]},
  {:uid=>"5cf4JpNHZ13iugCV65F1lT", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Self-help", "uri"=>"spotify:genre:0JQ5DAqbMKFLPhtHltUeTr"}]},
  {:uid=>"33450hhCQdEEqRpd4w1TBe", :genres=>[]},
  {:uid=>"61uYuifW41s8WztnlcKFxA", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Language", "uri"=>"spotify:genre:0JQ5DAqbMKFGvEvBJcLHVZ"}]},
  {:uid=>"3tBD2l1Pu1NMGqfiweKF3I", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Careers", "uri"=>"spotify:genre:0JQ5DAqbMKFMnJvsZliRJL"}, {"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"4dDhF3cXpVST2oQwDGhsN7", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"6l1rTq9zn35FDp8teV3h7p", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Language", "uri"=>"spotify:genre:0JQ5DAqbMKFGvEvBJcLHVZ"}]},
  {:uid=>"6PFV8q5KhZ2YZA0XfddYhh", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Business", "uri"=>"spotify:genre:0JQ5DAqbMKFK0EBNV8Wn6R"}, {"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"2wnpdaxTbMaKQVVmUxb9QW", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"6nOTQLa2uZxeyGpMW8eppS", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"5suS91H6OfqDt14ZsOD4RV", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Careers", "uri"=>"spotify:genre:0JQ5DAqbMKFMnJvsZliRJL"}, {"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"434ZpirtxvKZmW3yWICCsR", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"2yHLacgm5hunwsFZeoV8NA", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"How-to", "uri"=>"spotify:genre:how_to_podcasts"}, {"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"3lANANFM01ZFFbS6IbGkKC", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"3GWxZN0PdWj4PTrXbBSPxy", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Language", "uri"=>"spotify:genre:0JQ5DAqbMKFGvEvBJcLHVZ"}, {"__typename"=>"PodcastTopic", "title"=>"Educational podcasts", "uri"=>"spotify:genre:educational_podcasts"}]},
  {:uid=>"0tTo7dvWDdMQmPCEIcG3EU", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Careers", "uri"=>"spotify:genre:0JQ5DAqbMKFMnJvsZliRJL"}, {"__typename"=>"PodcastTopic", "title"=>"Self-help", "uri"=>"spotify:genre:0JQ5DAqbMKFLPhtHltUeTr"}]},
  {:uid=>"7kpJ07MSm8c0lMdhxgneJx", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Relationships", "uri"=>"spotify:genre:0JQ5DAqbMKFIbOFW5Avg3a"}]},
  {:uid=>"6Tl8R2AHIKWY5Ecix7go4O", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Careers", "uri"=>"spotify:genre:0JQ5DAqbMKFMnJvsZliRJL"}]},
  {:uid=>"2LQQb08WTikg5SO85TzoxM", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"How-to", "uri"=>"spotify:genre:how_to_podcasts"}, {"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"6GFEu9fYpRsyFWZQJSLsGg", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"How-to", "uri"=>"spotify:genre:how_to_podcasts"}, {"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"65WRDvSFQ2tkdk1GXlRPqR", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"How-to", "uri"=>"spotify:genre:how_to_podcasts"}, {"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"6CScTHFyiShiCe6udWBSNJ", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Language", "uri"=>"spotify:genre:0JQ5DAqbMKFGvEvBJcLHVZ"}]},
  {:uid=>"53aB4WbdIr7lto02Us8HGc", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Business", "uri"=>"spotify:genre:0JQ5DAqbMKFK0EBNV8Wn6R"}, {"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"0savdPp3XFsOOUQx6Ygbw5", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Business", "uri"=>"spotify:genre:0JQ5DAqbMKFK0EBNV8Wn6R"}]},
  {:uid=>"4UXYnA8xATrDkPC9aZAtoj", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Business", "uri"=>"spotify:genre:0JQ5DAqbMKFK0EBNV8Wn6R"}, {"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"1s3hWl6tMQYtkdihHP3Alq", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Careers", "uri"=>"spotify:genre:0JQ5DAqbMKFMnJvsZliRJL"}, {"__typename"=>"PodcastTopic", "title"=>"Health", "uri"=>"spotify:genre:health_podcasts"}, {"__typename"=>"PodcastTopic", "title"=>"Business", "uri"=>"spotify:genre:0JQ5DAqbMKFK0EBNV8Wn6R"}]},
  {:uid=>"3MGca3ih71AlhPNEo3slnt", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}]},
  {:uid=>"03b6uLQiebW4vLA75bagYW", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"History", "uri"=>"spotify:genre:0JQ5DAqbMKFKK9EFSCDuOS"}, {"__typename"=>"PodcastTopic", "title"=>"Philosophy", "uri"=>"spotify:genre:0JQ5IMCbQBLjLJlIwYDak9"}]},
  {:uid=>"21enSJoK4AIwJM1WTvacIJ", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Relationships", "uri"=>"spotify:genre:0JQ5DAqbMKFIbOFW5Avg3a"}, {"__typename"=>"PodcastTopic", "title"=>"Self-help", "uri"=>"spotify:genre:0JQ5DAqbMKFLPhtHltUeTr"}]},
  {:uid=>"69Jts4KvNZOFHz7NEuucOs", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Language", "uri"=>"spotify:genre:0JQ5DAqbMKFGvEvBJcLHVZ"}]},
  {:uid=>"7wORCl6VQwgBj5g6p2wgE7", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Language", "uri"=>"spotify:genre:0JQ5DAqbMKFGvEvBJcLHVZ"}]},
  {:uid=>"3BThje2qx6WvjZT6iU3oMy", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Self-help", "uri"=>"spotify:genre:0JQ5DAqbMKFLPhtHltUeTr"}, {"__typename"=>"PodcastTopic", "title"=>"Language", "uri"=>"spotify:genre:0JQ5DAqbMKFGvEvBJcLHVZ"}]},
  {:uid=>"6FCuqjUen271mnuSga1gjr", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Football", "uri"=>"spotify:genre:0JQ5DAqbMKFLPwE3vGBDOP"}, {"__typename"=>"PodcastTopic", "title"=>"Language", "uri"=>"spotify:genre:0JQ5DAqbMKFGvEvBJcLHVZ"}]},
  {:uid=>"1ZScNQgfrD6J1gstTz3nza", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Film", "uri"=>"spotify:genre:0JQ5IMCbQBLBylyI0RX5u8"}]},
  {:uid=>"4UXAtHKJlmeEIHFoUzPTiT", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Language", "uri"=>"spotify:genre:0JQ5DAqbMKFGvEvBJcLHVZ"}, {"__typename"=>"PodcastTopic", "title"=>"Educational podcasts", "uri"=>"spotify:genre:educational_podcasts"}]},
  {:uid=>"0MUGibSX8ejhSIbOdBxMuE", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Film", "uri"=>"spotify:genre:0JQ5IMCbQBLBylyI0RX5u8"}, {"__typename"=>"PodcastTopic", "title"=>"Careers", "uri"=>"spotify:genre:0JQ5DAqbMKFMnJvsZliRJL"}, {"__typename"=>"PodcastTopic", "title"=>"TV", "uri"=>"spotify:genre:0JQ5IMCbQBLo64OouK01L3"}]},
  {:uid=>"3tD18X1Xx9P15unmuatrDo", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Society", "uri"=>"spotify:genre:0JQ5DAqbMKFLFBJyefzcxG"}, {"__typename"=>"PodcastTopic", "title"=>"Culture", "uri"=>"spotify:genre:0JQ5DAqbMKFP9ywiCs8qKW"}, {"__typename"=>"PodcastTopic", "title"=>"Comedy", "uri"=>"spotify:genre:0JQ5DAqbMKFNr6gDrHHVKL"}]},
  {:uid=>"4Nmm0SwSDbtk828V0Qny4K", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Society", "uri"=>"spotify:genre:0JQ5DAqbMKFLFBJyefzcxG"}, {"__typename"=>"PodcastTopic", "title"=>"Documentary", "uri"=>"spotify:genre:0JQ5DAqbMKFCWOPjGCVIq4"}, {"__typename"=>"PodcastTopic", "title"=>"Personal stories", "uri"=>"spotify:genre:0JQ5DAqbMKFIHya0xgnxbE"}]},
  {:uid=>"7r4ctLg0oQZ4T2jEdWHQLa", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Business", "uri"=>"spotify:genre:0JQ5DAqbMKFK0EBNV8Wn6R"}]},
  {:uid=>"2YUWx9SSJZz5Akmw3fSzyM", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Society", "uri"=>"spotify:genre:0JQ5DAqbMKFLFBJyefzcxG"}, {"__typename"=>"PodcastTopic", "title"=>"Culture", "uri"=>"spotify:genre:0JQ5DAqbMKFP9ywiCs8qKW"}]},
  {:uid=>"4eW3Kd9umRDthuJH9kIo1f", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Society", "uri"=>"spotify:genre:0JQ5DAqbMKFLFBJyefzcxG"}, {"__typename"=>"PodcastTopic", "title"=>"Culture", "uri"=>"spotify:genre:0JQ5DAqbMKFP9ywiCs8qKW"}]},
  {:uid=>"4TZYoo5M0XlLMBLELVC48s", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Society", "uri"=>"spotify:genre:0JQ5DAqbMKFLFBJyefzcxG"}, {"__typename"=>"PodcastTopic", "title"=>"Culture", "uri"=>"spotify:genre:0JQ5DAqbMKFP9ywiCs8qKW"}, {"__typename"=>"PodcastTopic", "title"=>"Comedy", "uri"=>"spotify:genre:0JQ5DAqbMKFNr6gDrHHVKL"}]},
  {:uid=>"5uZiCeMk5447TmUz9h5gfh", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Technology", "uri"=>"spotify:genre:tech_interviews_podcasts"}, {"__typename"=>"PodcastTopic", "title"=>"Comedy", "uri"=>"spotify:genre:0JQ5DAqbMKFNr6gDrHHVKL"}]},
  {:uid=>"794NeMvkJ7XiYdNqRBjY2v", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Society", "uri"=>"spotify:genre:0JQ5DAqbMKFLFBJyefzcxG"}, {"__typename"=>"PodcastTopic", "title"=>"Culture", "uri"=>"spotify:genre:0JQ5DAqbMKFP9ywiCs8qKW"}]},
  {:uid=>"5FSxGJ1vlXZoTHsb1LRH4M", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Society", "uri"=>"spotify:genre:0JQ5DAqbMKFLFBJyefzcxG"}, {"__typename"=>"PodcastTopic", "title"=>"Culture", "uri"=>"spotify:genre:0JQ5DAqbMKFP9ywiCs8qKW"}, {"__typename"=>"PodcastTopic", "title"=>"Philosophy", "uri"=>"spotify:genre:0JQ5IMCbQBLjLJlIwYDak9"}]},
  {:uid=>"1AS63PeBBLSF3gPu3UeUAc", :genres=>[]},
  {:uid=>"0G7CxOnDPZ6opkmF1AdN8Q", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Comedy", "uri"=>"spotify:genre:0JQ5DAqbMKFNr6gDrHHVKL"}]},
  {:uid=>"3GbiJxbiumUkGiiCFWdxOu", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Comedy", "uri"=>"spotify:genre:0JQ5DAqbMKFNr6gDrHHVKL"}]},
  {:uid=>"03jKYtQIwVAKxz9cNBmhm1", :genres=>[]},
  {:uid=>"1JPH7aIj5nKpHtptJewwh5", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Comedy", "uri"=>"spotify:genre:0JQ5DAqbMKFNr6gDrHHVKL"}]},
  {:uid=>"2452cPk0bPV2mhQp2hrdzn", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"Stories", "uri"=>"spotify:genre:0JQ5DAqbMKFHv2c1dK1Jdi"}]},
  {:uid=>"53U7d8tQiBfbEctv7QESQo", :genres=>[{"__typename"=>"PodcastTopic", "title"=>"History", "uri"=>"spotify:genre:0JQ5DAqbMKFKK9EFSCDuOS"}]}
]

# Creating categories

podcasts.each do |podcast|
  puts "Creating category #{podcast[:uid]}"
  if podcast[:genres]
    podcast[:genres].each do |genre|
      category = Category.find_or_create_by(name: genre["title"])
    end
  else
    "No genres for #{podcast[:uid]}"
  end
end

# Connecting podcasts to categories

podcasts.each do |podcast|
  puts "Creating genres #{podcast[:uid]}"
  if podcast[:genres]
    pp = Podcast.find_by(uid: podcast[:uid])
    if pp
      podcast[:genres].each do |genre|
        category = Category.find_by(name: genre["title"])
        if category
          pp.categories << category
        else
          puts "No category for #{genre["title"]}"
        end
      end
    end
  else
    "No genres for #{podcast[:uid]}"
  end
end
