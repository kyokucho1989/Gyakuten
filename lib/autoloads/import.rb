require "csv"

class Import
  # rake import_csv:movie_data
  def self.movie_data(path = "db/data/movies.csv")
    Movie.delete_all
    data_list = []
    CSV.foreach(path, headers: true) do |row|
      data_list << {
        title: row["Title"],
        contents: row["Contents"],
        desc: row["Desc"],
        genre: row["Genre"],
      }
    end
    Rails.logger.info "start import"
    Movie.create!(data_list)
    Rails.logger.info "success import"
  rescue ActiveModel::UnknownAttributeError => e
    Rails.logger.info "failed import #{e}"
  end

  # rake import_csv:text_data
  def self.text_data(path = "db/data/texts.csv")
    Text.delete_all
    data_list = []
    CSV.foreach(path, headers: true) do |row|
      data_list << {
        title: row["Title"],
        contents: row["Contents"],
        genre: row["Genre"],
      }
    end
    Rails.logger.info "start import"
    Text.create!(data_list)
    Rails.logger.info "success import"
  rescue ActiveModel::UnknownAttributeError => e
    Rails.logger.info "failed import #{e}"
  end

  # rake import_csv:money_data
  def self.money_data(path = "db/data/money.csv")
    Money.delete_all
    data_list = []
    CSV.foreach(path, headers: true) do |row|
      data_list << {
        title: row["Title"],
        contents: row["Contents"],
        genre: row["Genre"],
      }
    end
    Rails.logger.info "start import"
    Money.create!(data_list)
    Rails.logger.info "success import"
  rescue ActiveModel::UnknownAttributeError => e
    Rails.logger.info "failed import #{e}"
  end
end