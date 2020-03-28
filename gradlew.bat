/*
 * Copyright (c) 1997, 2015, Oracle and/or its affiliates. All rights reserved.
 * ORACLE PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 */

package javax.swing.plaf.basic;

import sun.swing.SwingUtilities2;
import sun.swing.DefaultLookup;
import sun.swing.UIAction;
import sun.awt.AppContext;

import javax.swing.*;
import javax.swing.plaf.*;
import javax.swing.text.View;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.Component;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.Rectangle;
import java.awt.Insets;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.Font;
import java.awt.FontMetrics;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;

/**
 * A Windows L&amp;F implementation of LabelUI.  This implementation
 * is completely static, i.e. there's only one UIView implementation
 * that's shared by all JLabel objects.
 *
 * @author Hans Muller
 */
public class BasicLabelUI extends LabelUI implements  PropertyChangeListener
{
   /**
    * The default <code>BasicLabelUI</code> instance. This field might
    * not be used. To change the default instance use a subclass which
    * overrides the <code>createUI</code> method, and place that class
    * name in defaults table under the key "LabelUI".
    */
    protected static BasicLabelUI labelUI = new BasicLabelUI();
    private static final Object BASIC_LABEL_UI_KEY = new Object();

    private Rectangle paintIconR = new Rectangle();
    private Rectangle paintTextR = new Rectangle();

    static void loadActionMap(LazyActionMap map) {
        map.put(new Actions(Actions.PRESS));
        map.put(new Actions(Actions.RELEASE));
    }

    /**
     * Forwards the call to SwingUtilities.layoutCompoundLabel().
     * This method is here so that a subclass could do Label specific
     * layout and to shorten the method name a little.
     *
     * @param label an instance of {@code JLabel}
     * @param fontMetrics a font metrics
     * @param text a text
     * @param icon an icon
     * @param viewR a bounding rectangle to lay out label
     * @param iconR a b