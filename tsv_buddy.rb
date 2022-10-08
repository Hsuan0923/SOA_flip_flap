# frozen_string_literal: true

TAB = "\t"
NEWLINE = "\n"
# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    rows = tsv.split(NEWLINE).map { |line| line.split(TAB) }
    headers = rows.first
    @data = rows.drop(1).map { |col| headers.zip(col).to_h }
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    header = [@data.first.keys]
    content = @data.map(&:values)
    tsv_array = header.concat(content)
    tsv_array.map { |row| row.join(TAB) + NEWLINE }.join
  end
end
