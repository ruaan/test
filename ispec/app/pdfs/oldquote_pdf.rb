class QuotewoeiyhweiohewfhbPdf < Prawn::Document
    def initialize()
        super(top_margin: 70)

        order_number
        line_items
    end

    def order_number
        dice = "public/logo_italtile.png"
        image dice, :at => [100, 650], :scale => 0.75
        move_down(480)
        text "UNISA - Prism Prices are based on the following exchange rates: Euro 1.00 = ZAR 14.30/ US$1.00 = ZAR 10.70" , size: 10, style: :normal
        move_down(20)
        text "Customer name: Sun International", size: 20, style: :normal
        move_down(5)
        text "Project name: Broadwalk", size: 12, style: :normal
        move_down(5)
        text "Email Address:admin@local.com" , size: 12, style: :normal
        move_down(5)
        text "Date: 19 - 11 - 2014" , size: 12, style: :normal


    end

    def line_items
        move_down 190
        text "First Floor", size: 12, style: :normal
        move_down(5)
        text "Guest Bathroom", size: 12, style: :normal
        move_down(5)
        table line_item_rows1
        move_down(20)
        text "Second Floor", size: 12, style: :normal
        move_down(5)
        text "Guest Bathroom", size: 12, style: :normal
        move_down(5)
        table line_item_rows2
        text "Main Bathroom", size: 12, style: :normal
        move_down(5)
        table line_item_rows3
    end

    def line_item_rows1
        image_path1 ="public/basins.jpg"
        image_path3 ="public/toilet.jpg"
        image_path4 ="public/wtile.jpg"

        [["Image", "Title", "SKU","QTY" ,"Description", "Price"],
         [{:image => image_path1}, "Basins 1", "ITA005", "x1", "This is a Basins", "R 332.00"],[{:image => image_path3}, "Toilets", "ITA0014","x1", "This is a Toilet", "R 3434.00"],
         [{:image => image_path4}, "Tile 2", "ITA002","x1", "This is a tile", "R 34345.00"]
        ]


    end
    def line_item_rows2

        image_path2 ="public/wall.jpg"
        image_path3 ="public/toilet.jpg"
        image_path4 ="public/wtile.jpg"

        [["Image", "Title", "SKU","QTY" ,"Description", "Price"],
         [{:image => image_path3}, "Toilets", "ITA0014","x1", "This is a Toilet", "R 3434.00"],
         [{:image => image_path4}, "Tile 2", "ITA002","x1", "This is a tile", "R 34345.00"],[{:image => image_path2}, "Acc", "ITA005","x1", "This is a wall unit", "R 3432243.00"]
        ]


    end
    def line_item_rows3
        image_path1 ="public/basin.jpg"

        image_path3 ="public/toilet.jpg"
        image_path5 ="public/dtile.jpg"

        [["Image", "Title", "SKU","QTY" ,"Description", "Price"],
         [{:image => image_path1}, "Basins 1", "ITA005","x1", "This is a Basins", "R 332.00"],[{:image => image_path3}, "Toilets", "ITA0014", "x1","This is a Toilet", "R 3434.00"],
         [{:image => image_path5}, "Tile 1", "ITA001", "x1","This is a tile", "R 3333.00"]
        ]


    end
end
