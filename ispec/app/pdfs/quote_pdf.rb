class QuotePdf < Prawn::Document
    def initialize(accounts,now)
        super(top_margin: 70)
        check = now.last

        theaccount = Account.find(id = check.account_id)

        dice = "public/logo_italtile.png"
        image dice, :at => [100, 650], :scale => 0.75
        move_down(480)
        text "UNISA - Prism Prices are based on the following exchange rates: Euro 1.00 = ZAR 14.30/ US$1.00 = ZAR 10.70" , size: 10, style: :normal
        move_down(20)

        text "Customer name:" + theaccount.name, size: 20, style: :normal
        move_down(10)
        text "Ref:" + check.projectName, size: 12, style: :normal
        move_down(10)
        text "Email Address:" + theaccount.email , size: 12, style: :normal
        move_down(10)
        text "Date:" + Time.now.strftime("%Y-%d-%m %H:%M:%S %Z") , size: 12, style: :normal
        move_down(120)
        @subsections = Subsection.all
        @lineitems = Lineitem.all

        @sections = Section.where(project_id: check.id)


        @sections.each do |section|
            if section.name.blank?

            else
                text section.name, size: 14, style: :bold
                move_down(10)
                for subsection in section.subsections
                    text subsection.name, size: 12, style: :normal
                    move_down(10)
                    image_path2 ="public/wall.jpg"
                    table  (subsection.lineitems.collect { |line| [ {:image => "public/"+line.image.to_s,:scale => 0.25 }, line.title, line.sku, line.description, line.subdescription, line.price]})
                end
            end
        end
    end
end
