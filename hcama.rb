require "csv"
def my_replace column, old_value, new_value
   return column.gsub!(old_value, new_value) if column
end

old_file = CSV.open("hca_ma_raw.csv")
new_file = CSV.open("hca_midamerica.csv", "w")
line = old_file.readline
line = ["brand physician id",	"npi number",	"last name",	"first name",	"middle name",	"suffix",	"degree",	"gender",	"medical school",	"graduation date",	"practice name 1_cd",	"practice website 1_cd",	"office address 1",	"office address suite 1",	"city 1",	"state 1",	"zip code 1",	"phone 1", "fax 1_cd",
  "office hours 1_cd",	"practice name 2_cd",	"practice website 2_cd",	"office address 2",	"office address suite 2",	"city 2",	"state 2",	"zip code 2",	"phone 2",	"fax 2_cd",	"office hours 2_cd",	"practice name 3_cd",	"practice website 3_cd",	"office address 3",	"office address suite 3",	"city 3",	"state 3",	"zip code 3",	"phone 3",	"fax 3_cd",
  "office hours 3_cd",	"practice name 4_cd",	"practice website 4_cd",	"office address 4",	"office address suite 4",	"city 4",	"state 4",	"zip code 4",	"phone 4",	"fax 4",	"office hours 4",	"practice name 5_cd",	"practice website 5_cd",	"office address 5",	"office address suite 5",	"city 5",	"state 5",	"zip code 5",	"phone 5",	"fax 5_cd",
  "office hours 5_cd",	"practice name 6_cd",	"practice website 6_cd",	"office address 6",	"office address suite 6",	"city 6",	"state 6",	"zip code 6",	"phone 6",	"fax 6_cd",	"office hours 6_cd",	"practice name 7_cd",	"practice website 7_cd",	"office address 7",	"office address suite 7",	"city 7",	"state 7",	"zip code 7",	"phone 7",	"fax 7_cd",
  "office hours 7_cd",	"practice name 8_cd",	"practice website 8_cd",	"office address 8",	"office address suite 8",	"city 8",	"state 8",	"zip code 8",	"phone 8",	"fax 8_cd",	"practice name 9_cd",	"practice website 9_cd",	"office hours 8_cd",	"office address 9",	"office address suite 9",	"city 9",	"state 9",	"zip code 9",	"phone 9",	"fax 9_cd",
  "office hours 9_cd",	"practice name10_cd",	"practice website 10_cd",	"office address 10",	"office address suite 10",	"city 10",	"state 10",	"zip code 10",	"phone 10",	"fax 10_cd",	"office hours 10_cd",	"specialty 1",	"specialty 2",	"specialty 3",	"specialty 4",	"specialty 5",	"language 1",	"language 2",	"language 3",	"language 4",
  "language 5",	"hospital affilation(s)",	"photo_cd",	"logo_cd",	"tag line",	"video",	"professional interest_cd",	"conditions treated_cd",	"procedures performed_cd",	"philosophy of care_cd",	"awards_cd",	"personal interest_cd",	"internship_cd",	"residencies_cd",	"fellowships_cd",	"division name_cd",	"region name_cd",	"record action_cd",	"delta"]
  newline = Array.new
line.each do |item|
end
new_file << line
new_file.close
old_file.close

contents = CSV.open "hca_ma_raw.csv", headers: true, header_converters: :symbol
contents.each do |row|

  row[:logo_cd] = "hca_logo.jpg"
  if row[:photo_cd] == nil
    row[:photo_cd] = "hca_logo.jpg"
  end

  specialty = row[:specialty_1]
  specialty2 = row[:specialty_2] || " "
  specialty3 = row[:specialty_3] || " "
  specialty4 = row[:specialty_4] || " "
  specialty5 = row[:specialty_5] || " "

  specialty_correction = specialty
  specialty_correction2 = specialty2
  specialty_correction3 = specialty3
  specialty_correction4 = specialty4
  specialty_correction5 = specialty5

  # Fill in bad specialties between / / and corrected between " "

  [ row[:specialty_1], row[:specialty_2], row[:specialty_3], row[:specialty_4], row[:specialty_5]].each do |obj|
    my_replace obj, /Cardiovascular Disease/, "Cardiology"
    my_replace obj, /Orthopaedic Surgery/, "Orthopedic Surgery"
    my_replace obj, /Neurological Surgery/, "Neurology"
    my_replace obj, /Gynecology\/ Oncology/, "Obstetrician and Gynecology "
    my_replace obj, /Hospice & Palliative Medicine/, "Hospice Care and Palliative Medicine "
    my_replace obj, /Cardiac Electrophysiology/, "Clinical Cardiac Electrophysiology "
    my_replace obj, /Clinical Clinical Cardiac Electrophysiology/, "Clinical Cardiac Electrophysiology "
    my_replace obj, /Breast Care\/Surgical Oncologist/, "Gynecologic Oncology"
    my_replace obj, /Pulmonary\/Critical Care/, "Pulmonology"
    my_replace obj, /Endocrinology \/ Metabolism, Internal Medicine/, "Diabetes, Endocrinology and Metabolism"
    my_replace obj, /Thoracic and Cardiovascular Surgery/, "Cardiothoracic Surgery"
    my_replace obj, /Pain Management Medicine/, "Pain Medicine"
    my_replace obj, /Podiatric Surgery/, "Podiatry"
    my_replace obj, /Surgery of the Hand/, "Hand Surgery"
    my_replace obj, /Reproductive Endocrinology\/Infertility/, "Infertility and Reproductive Endocrinology"
    my_replace obj, /Family Medicine and OMT/, "Family Medicine"
    my_replace obj, /Joint Replacement/, "Joint Replacement Surgery"
    my_replace obj, /Joint Replacement Surgery Surgery/, "Joint Replacement Surgery"
 end

  CSV.open("hca_midamerica.csv", "a+") do |csv|
    csv << row
  end
end
