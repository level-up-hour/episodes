package main

import (
	"encoding/json"
	"html/template"
	"log"
	"net/http"
)

/**
* Flag for throwing a 503 when enabled
 */
var misbehave = false

func HomePage(w http.ResponseWriter, r *http.Request) {

	template := template.Must(template.ParseFiles("templates/homepage.html"))

	err := template.Execute(w, nil) //execute the template
	if err != nil {                 // if there is an error
		log.Print("template executing error: ", err) //log it
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}
}

func GetProducts(w http.ResponseWriter, r *http.Request) {

	if misbehave {
		w.WriteHeader(http.StatusServiceUnavailable)
		w.Write([]byte("Misbehavior of the Catalog GoLang Service\n"))
	} else {
		products := Products{
			Product{ItemId: "100000", Name: "Red Fedora", Description: "OFFICIAL RED HAT FEDORA", Price: 34.99},
			Product{ItemId: "329299", Name: "Quarkus T-shirt", Description: "THIS UPDATED UNISEX ESSENTIAL FITS LIKE A WELL-LOVED FAVORITE, FEATURING A CREW NECK, SHORT SLEEVES AND DESIGNED WITH SUPERIOR COMBED AND RING- SPUN COTTON.", Price: 10.00},
			Product{ItemId: "329199", Name: "Pronounced Kubernetes", Description: "KUBERNETES IS CHANGING HOW ENTERPRISES WORK IN THE CLOUD. BUT ONE OF THE BIGGEST QUESTIONS PEOPLE HAVE IS: HOW DO YOU PRONOUNCE IT?", Price: 9.00},
			Product{ItemId: "165613", Name: "Knit socks", Description: "YOUR BRAND WILL GET NOTICED ON THESE FULL COLOR KNIT SOCKS. IMPORTED.", Price: 4.15},
			Product{ItemId: "165614", Name: "Quarkus H2Go water bottle", Description: "SPORTY 16. 9 OZ DOUBLE WALL STAINLESS STEEL THERMAL BOTTLE WITH COPPER VACUUM INSULATION, AND THREADED INSULATED LID. IMPRINTED. IMPORTED.", Price: 14.45},
			Product{ItemId: "165954", Name: "Patagonia Refugio pack 28L", Description: "MADE FROM 630-DENIER 100% NYLON (50% RECYCLED/50% HIGH-TENACITY) PLAIN WEAVE; LINED WITH 200-DENIER 100% RECYCLED POLYESTER. BOTH TREATED WITH A POLYURETHANE COATING AND A DWR (DURABLE WATER REPELLENT) FINISH FOR WATER-RESISTANCE. MAIN COMPARTMENT IS CAVERNOUS AND INCLUDES A PADDED LAPTOP SLEEVE AND LINED TABLET POCKET; INTERNAL PADDED POCKET. EMBROIDERED WITH REDHAT LOGO.", Price: 6.00},
			Product{ItemId: "444434", Name: "Red Hat Impact T-shirt", Description: "THIS 4. 3 OUNCE, 60% COMBED RINGSPUN COTTON/40% POLYESTER JERSEY T- SHIRT FEATURES A SLIGHTLY HEATHERED APPEARANCE. THE FABRIC LAUNDERED FOR REDUCED SHRINKAGE. NEXT LEVEL BRAND APPAREL. PRINTED.", Price: 9.00},
			Product{ItemId: "444435", Name: "Quarkus twill cap", Description: "100% COTTON CHINO TWILL CAP WITH AN UNSTRUCTURED, LOW-PROFILE, SIX-PANEL DESIGN. THE CROWN MEASURES 3 1/8 AND THIS FEATURES A PERMACURV VISOR AND A BUCKLE CLOSURE WITH A GROMMET.", Price: 13.00},
			Product{ItemId: "444437", Name: "Nanobloc Universal Webcam Cover", Description: "NANOBLOC WEBCAM COVER FITS PHONE, LAPTOP, DESKTOP, PC, MACBOOK PRO, IMAC, IPHONEANDROID PHONE, COMPUTER, CONTROL YOUR PRIVACY, STRONG SUCTION NO RESIDUE (3 PACK, BLACK). REUSABLE OVER AND OVER AGAIN. JUST RINSE WITH WATER IF GETS DIRTY TO REGAIN STICKINESS", Price: 2.75},
		}

		// Define Content-Type = application/json
		w.Header().Set("Content-Type", "application/json; charset=UTF-8")
		if err := json.NewEncoder(w).Encode(products); err != nil {
			panic(err)
		}
	}
}

func Behave(w http.ResponseWriter, r *http.Request) {
	misbehave = false
	log.Print("'misbehave' has been set to 'false'")
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("Next request to / will return 200\n"))
	return
}

func Misbehave(w http.ResponseWriter, r *http.Request) {
	misbehave = true
	log.Print("'misbehave' has been set to 'true'")
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("Next request to / will return a 503\n"))
	return
}
