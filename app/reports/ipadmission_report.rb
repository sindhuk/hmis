class IpadmissionReport < Ruport::Controller

  stage :list

  def setup
	conditions=options.mrno
    self.data = Ipadmission.report_table(:all, :conditions => conditions)
  end

  formatter :html do
    build :list do
      output << textile("h3. Book List")
      output << data.to_html
    end
  end

  formatter :pdf do
    build :list do
      pad(10) { add_text "Ipadmission" }
      draw_table data
    end
  end

  formatter :csv do
    build :list do
      output << data.to_csv
    end
  end
end
