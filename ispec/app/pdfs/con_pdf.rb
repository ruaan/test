class ConPdf < Prawn::Document

    TABLE_HEADERS = ["ID", "Name", "Date", "User","5"]
    TABLE_WIDTHS = [100, 100, 80, 100,100,60]
    TABLE_ROW_COLORS = ["FFFFFF","DDDDDD"]
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
      text "Ref:" + check.projectName,size: 12, style: :normal
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
            table [["","Title","Sku","Description","Sub-description","Price"]],column_widths: TABLE_WIDTHS
            items = subsection.lineitems.collect { |line| [ {:image => "public/"+line.image.to_s,:scale => 0.25 }, line.title, line.sku, line.description, line.subdescription, line.price]}
            table items,column_widths: TABLE_WIDTHS,row_colors: TABLE_ROW_COLORS

          end
        end
      end




text "STANDARD TERMS AND CONDITIONS

1. in this agreement, except where the context indicates otherwise:
1.1. 'The Customer' means, jointly and severally, the signatory hereto
and any person on whose behalf the signatory signs this agreement;
1.2. 'Italtile' means Italtile Ceramics Limited and its subsidiaries
and associate companies as well as the franchisees of those entities,
from time to time.
2.
2.1. Quotations are valid for 14 days, subject to the availability
of goods or services and subject to correction of good faith errors by
Italtile and/or its employees or agents.
2.2. Prices quoted are subject to increases in cost price, including
currency fluctuations, before acceptance of the quotation by the Customer.
2.3. The Customer hereby confirms that the goods and/or services on the
Tax Invoice issued duly represent the goods and/or services ordered by the
Customer at prices agreed to by the Customer and, where delivery / performance
has already occurred, the goods and/or services were inspected and the Customer
is satisfied that these conform with the quality and quantity ordered and are
free from defects.
2.4. The Customer may request Italtile to store the goods purchased and paid
for by the Customer at the premises of Italtile, in which event the Customer
shall bear the risk of damage to, destruction or theft of the goods so stored.
2.5. Italtile may appoint a third party to transport the goods on the Customer''''s
behalf on terms deemed fit by Italtile and the Customer hereby indemnifies Italtile
from any claims of whatsoever nature which may be brought against Italtile as a result
of the a foregoing.  The premise of delivery shall be deemed to be at ground floor level at                                  the Customer specified address.  No deliveries will be carried out to any level above ground                             floor level at the address specified by a Customer, by Italtile or by its staff or its representatives.                      The customer indemnifies Italtile, its staff or its representative from any claims whatsoever in the                   event that deliveries are carried out above ground level.
2.6. Any delivery note or waybill (copy or original) signed by the Customer or a
third party engaged to transport the goods and held by Italtile shall be prima facie
proof that the goods were delivered to the Customer.
2.7. Delivery times quoted are merely estimates and are not binding on Italtile.
2.8. The Customer agrees to accept any quantity that does not exceed or fall short
of the quantity ordered by more than 10% as good and complete performance.
2.9. The Customer accepts that colour shade as well as size variations may occur
amongst individual and batches of tiles.

2.10. The Customer agrees to pay all costs resulting from any acts or omissions of
the Customer including suspension of work, modification of requirements, failure or
delay in giving particulars necessary to enable work to proceed on schedule or
requirements that work be completed earlier than agreed.
3.
3.1. New goods are guaranteed by the Manufacturer's product-specific
warranties only.
Services carry no guarantee.
3.2. Italtile's liability in respect of the manufacture's product-specific warranty
shall be limited to the cost of repair or replacement of faulty goods or services or
granting of a credit at the sole discretion of Italtile.
3.3. The Customer agrees that neither Italtile nor any of its employees or agents
will be liable for any innocent or negligent misrepresentations made to the Customer.
3.4. It is the responsibility of the Customer to determine that the goods or
services ordered are suitable for the purposes of intended use.
3.5. No claim under this Agreement shall arise unless the Customer has, within
7 days of the alleged breach or defect occurring, given Italtile 30 days written
notice by prepaid registered post to rectify any defect or breach.
3.6. All claims shall be supported by the original Tax Invoice.
3.7. Italtile shall not be liable for any consequential damages or for any
edictal liability of any nature whatsoever, nor for any damage arising from
any misuse or abuse of the goods or services.
3.8. The Customer shall return any defective goods to the premises of
Italtile at the Customer's own cost and packed in the original packaging,
provided that Italtile shall in that event be entitled to charge the
Customer a handling fee of 10% of the total invoice amount.
3.9. No goods will be accepted for return after a period of 6 months has passed from                                      date of purchase, surplus goods returned prior to this period may at management’s                                discretion attract a handling fee.
4.
4.1. The price on the Tax Invoice issued by Italtile shall:
4.1.1. Be paid in cash on issue of the invoice; or
4.1.2. If the Customer is a Credit Approved Customer, be paid within 30
days of the end of the month in which it was first issued.
4.2. The Customer agrees to pay the amount on the Tax Invoice at the
offices of Italtile or at such other place Italtile may designate in writing.
4.3. Any amounts not paid when due will bear interest at the prime rate of
interest charged by Italtile's bankers plus 5%.
4.4. Discounts are automatically forfeited if payment in full is not made
on the due date.


4.5. The Customer has no right to set-off or withhold payment for any
reason whatsoever. No extension of payment of any nature shall be extended
to the Customer unless agreed to in writing by Italtile beforehand.
4.6. A certificate under the hand of any executive director or manager of
Italtile, whose appointment it shall not be necessary to prove, as to the
indebtedness of the Customer in terms hereof, shall, in the absence of
manifest error, be prima facie evidence of the Customers
indebtedness to Italtile.
4.7. The Customer agrees to the Standard Rates of Italtile applicable
from time to time for any goods or services rendered, which rates may
be obtained on request.
5.
5.1. All goods supplied by Italtile remain the property of Italtile
until fully paid for whether such goods are attached to other property or not.
5.2. The Customer is not entitled to sell or dispose of any goods unpaid for.
The Customer shall not allow the goods to become encumbered in any manner prior
to the full payment thereof and shall advise third parties of the rights of
Italtile in the goods.
6. The Customer hereby consents to the storage and use by Italtile of
the personal information that it has provided to Italtile for establishing
its credit rating and to Italtile disclosing such information to credit
control companies, banks and other institutions involved in rating credit.
The Customer agrees that Italtile will not be held liable for the good
faith disclosure of any of this information to such a third party and
that no further specific consent need to be obtained for the transfer
of such information to a specific third party.
7. An event of default shall occur if:-
7.1. the Customer fails to make any payment in terms of this agreement
on due date and persists in such failure for a period of 3 days after the
date of written notice by Italtile to the Customer requiring the Customer
to effect such payment;
7.2. the Customer commits an act which is an act of insolvency within
the meaning of Section 8 of the Insolvency Act and fails to remedy the
default within 5 days of receipt by the Customer of notice from Italtile
requiring such default to be remedied;
7.3. Any of the assets of the Customer are attached under Writ of
Execution which Writ is not satisfied within 5 days after the issue thereof;
7.4. The Customer ceases to carry on business; or
7.5. The Customer compromises or attempts to compromise with any creditor
or body of creditors; or
7.6. The Customer is provisionally or finally wound-up other than the
voluntary liquidation implemented for the purpose of reconstruction or
amalgamation; or
7.7. The Customer is placed under judicial management, whether
provisionally or finally; or

7.8. The Customer breaches any of the terms of this agreement
(save for a breach contemplated in Clause 7.1 above)
and fails to remedy such breach within a period of 7 days from the date
of written notice by Italtile to the Customer requiring that such breach
are remedied.
8. Upon the occurrence of any event of default, Italtile shall,
without prejudice to any other rights which it may have in law, be
entitled to summarily cancel the transaction and declare the outstanding
amount of the Customer's indebtedness to be immediately due and payable.
9. Any order may also be cancelled by Italtile, without any right to
claim damages or any other relief on the part of the Customer due to Acts
of God from any cause beyond the control of Italtile, including but not
limited to inability to secure labour, power, materials or supplies, or
by reason of an act of God, war, civil disturbance, riot, state of
emergency, strike, lockout, or other labour disputes, fire, flood,
drought or legislation.
10. The invalidity of any part of this Agreement shall not affect
the validity of any other part.
11. The Customer shall be liable to Italtile for all legal expenses
incurred by Italtile on the attorney-and-own client scale in respect of
any action which may be instituted consequent upon any breach by the
Customer of this agreement.
12. Italtile shall have the right to institute legal action in the
Magistrate''''s Court or the High Court at its sole discretion, and
the Customer consents to that jurisdiction.
13. This Agreement shall be governed by the laws of South Africa
and the Customer consents to the exclusive jurisdiction of the
South African Courts.
14. The Customer agrees that Italtile will not be required to furnish
security in terms of Rule 62 of the Rules of Court of the Magistrate''''s
Courts or in terms of Rule 47 of the Law of the Supreme Court 59 of 1959.
15. The Customer agrees that no indulgence whatsoever by Italtile will
affect the terms of this agreement or any of the rights of Italtile and
such indulgence shall not constitute a waiver by Italtile in respect of
any of its rights herein.
16. This document contains the entire agreement between Italtile
and the Customer in regard to the matters with which this agreement
is concerned and neither party shall be bound by any undertakings,
representations, warranties, promises or the like not recorded or
otherwise contained herein.
17. No variation or consensual cancellation of this agreement
shall be of any force or effect unless reduced to writing and
signed by the Customer and an authorised representative of Italtile.
18. Italtile shall not be regarded as having waived, or be
precluded in any way from exercising any right under or arising
from this agreement by reason of its having at any time granted any
extension of time for, or having shown any indulgence to the Customer
with reference to, any payment or performance hereunder, or having
failed to enforce, or delayed in the enforcement of any right of
action against the Customer.
19. The parties choose as their domicilia citandi et executandi
the addresses mentioned on the face hereof, but such domicilium of
any party may be changed by written notice from such party to the
other parties with effect from the date of receipt or deemed receipt
by the latter of such notice.
20. Any notice, demand or other communication properly addressed
by a party to any other at the latter''''s domicilium in terms hereof
for the time being and sent by prepaid registered post shall be
deemed to be received by the latter on the tenth business day
following the date of posting thereof.
This provision shall not be construed as precluding the utilisation
of other means and methods (including telefacsimile) for the transmission
or delivery of notices, demands and other communications, but no presumption
of delivery shall arise if any such other means or method is used."

      end
  end