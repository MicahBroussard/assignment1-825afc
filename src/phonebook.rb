# PhoneBook class for storing names, phone numbers, and their listed status.
#
# Supports adding new entries, looking up by name or number,
# and retrieving names by area code.
class PhoneBook
  # Initializes a new, empty PhoneBook.
  #
  # @return [PhoneBook]
  def initialize
    @entries = [] # Array of hashes: { name: String, number: String, listed: Boolean }
  end

  # Adds a new entry to the phone book.
  #
  # @param name [String] the person's name
  # @param number [String] the phone number (format NNN-NNN-NNNN)
  # @param is_listed [Boolean] whether the entry should be listed
  # @return [Boolean] true if added successfully, false otherwise
  #
  # Conditions:
  # - A name must not already exist.
  # - Number must match the format `NNN-NNN-NNNN`.
  # - A number can appear unlisted multiple times.
  # - A number can only be listed once.
  def add(name, number, is_listed)
    # Check: name already exists
    return false if @entries.any? {|e| e[:name] == name}

    # Check: valid phone number format
    return false unless number =~ /^\d{3}-\d{3}-\d{4}$/

    # Check: listed numbers can only exist once
    if is_listed && @entries.any? {|e| e[:number] == number && e[:listed]}
      return false
    end

    @entries << {name:name, number:number, listed:is_listed}
    true
  end

  # Looks up a phone number by name.
  #
  # @param name [String] the name to look up
  # @return [String, nil] the phone number if listed, otherwise nil
  def lookup(name)
    entry = @entries.find {|e| e[:name] == name && e[:listed]}
    entry ? entry[:number] : nil
  end

  # Looks up a name by phone number.
  #
  # @param num [String] the phone number
  # @return [String, nil] the name if listed, otherwise nil
  def lookupByNum(num)
    entry = @entries.find {|e| e[:number] == num && e[:listed]}
    entry ? entry[:name] : nil
  end

  # Returns all names with phone numbers starting with a given area code.
  #
  # @param areacode [String] the area code to search for
  # @return [Array<String>] list of names (includes both listed and unlisted)
  def namesByAc(areacode)
    @entries
      .select {|e| e[:number].start_with?(areacode)}
      .map {|e| e[:name]}
  end
end