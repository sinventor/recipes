colors = {
	red: {
		rgb: "(255, 0, 0)",
		hsv: "(0dg, 100%, 100%)",
		hex: "#FF0000"
	},
	white: {
		rgb: "(255, 255, 255)",
		hsv: "(0dg, 0%, 100%)",
		hex: "#FFFFFF"
	},
	black: {
		rgb: "(0, 0, 0)",
		hsv: "(0dg, 0%, 0%)",
		hex: "#000000"
	},
	lime: {
		rgb: "(0, 255, 0)",
		hsv: "(0dg, 0%, 0%)",
		hex: "#00FF00"
	}
}

puts colors.sort_by {|k, v| v[:rgb]}