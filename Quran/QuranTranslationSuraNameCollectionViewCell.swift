//
//  QuranTranslationSuraNameCollectionViewCell.swift
//  Quran
//
//  Created by Mohamed Afifi on 3/31/17.
//
//  Quran for iOS is a Quran reading application for iOS.
//  Copyright (C) 2017  Quran.com
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//

import UIKit

class QuranTranslationSuraNameCollectionViewCell: QuranTranslationBaseCollectionViewCell {
    static let topPadding: CGFloat = 15
    static let bottomPadding: CGFloat = 15
    static let textHeight: CGFloat = 34 // deduced from the label font, if changed we need to change it

    static var cellHeight: CGFloat {
        return topPadding + bottomPadding + textHeight
    }

    let label: UILabel = UILabel()
    private var labelLeading: NSLayoutConstraint?
    private var labelTrailing: NSLayoutConstraint?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    private func setUp() {
        let colorView = UIView()
        let contentView = UIView()

        colorView.backgroundColor = #colorLiteral(red: 0.08235294118, green: 0.3215686275, blue: 0.3411764706, alpha: 1)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 28)
        label.textColor = .white

        contentView.addAutoLayoutSubview(label)
        colorView.addAutoLayoutSubview(contentView)
        self.contentView.addAutoLayoutSubview(colorView)

        contentView.vc
            .horizontalEdges()
            .bottom()
            .height(by: type(of: self).cellHeight)

        colorView.vc.edges()

        label.vc.verticalEdges(top: type(of: self).topPadding, bottom: type(of: self).bottomPadding)
        labelLeading = label.vc.leading(by: leadingMargin).constraint
        labelTrailing = label.vc.trailing(by: trailingMargin).constraint
    }

    override func layoutMarginsDidChange() {
        super.layoutMarginsDidChange()
        labelLeading?.constant = leadingMargin
        labelTrailing?.constant = trailingMargin
    }
}
