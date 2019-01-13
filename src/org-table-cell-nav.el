;; hopefully helps you zip around an org table, doing things...

(defun org-table-cell-go-right (&optional count)
	"Move to the right. With no arguments, just one cell, with an argument (integer) - move that many cells right."
	(dotimes (idx (or count 1)) (org-cycle)))

(defun org-table-cell-go-left (&optional count)
	"Move to the left. With no arguments, just one cell, with an argument (integer) - move that many cells left."
	(dotimes (idx (or count 1)) (org-shifttab)))

(defun org-table-cell-go-down (&optional count)
	"Move down. With no arguments, just one cell, with an argument (integer) - move that many cells down."
  (next-line count))

(defun org-table-cell-go-up (&optional count)
	"Move up. With no arguments, just one cell, with an argument (integer) - move that many cells up."
  (previous-line count))

(defun org-table-cell-chomp (str)
  "Chomp leading and tailing whitespace from STR."
  (replace-regexp-in-string (rx (or (: bos (* (any " \t\n")))
                                    (: (* (any " \t\n")) eos)))
                            ""
                            str))

(defun org-table-cell-value ()
	"Gives you the value of the cell. Always text - because you're in an org table."
	(save-excursion
		(org-table-cell-chomp (buffer-substring-no-properties (progn (search-backward "|" nil t) (forward-char) (point)) (progn (search-forward "|" nil t) (backward-char) (point))))))
