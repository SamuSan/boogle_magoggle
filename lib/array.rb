class Array
  # This needs a better name
  def each_cons_window_of(n)
    arr = self.dup

    Enumerator.new do |thing|
      while arr.length > 0
        thing << arr.slice(0, n)
        arr = arr.slice(1, arr.length)
      end
    end
  end
end
