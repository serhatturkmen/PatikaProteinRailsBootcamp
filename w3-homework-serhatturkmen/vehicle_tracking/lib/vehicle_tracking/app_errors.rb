module AppErrors

  class ModelNotFoundError < StandardError
    def message
      'Bulunmayan arac modeli.'
    end
  end

  class PlateFormatError < StandardError
    def message
      'Plaka formati uygun degil. (01-81 arasinda giriniz)'
    end
  end

  class PlateHasManyError < StandardError
    def message
      'Bu plakali arac var.'
    end
  end
end
