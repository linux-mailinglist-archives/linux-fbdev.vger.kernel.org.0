Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58B641B244C
	for <lists+linux-fbdev@lfdr.de>; Tue, 21 Apr 2020 12:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbgDUKsU (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 21 Apr 2020 06:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgDUKsT (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 21 Apr 2020 06:48:19 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5640CC061A0F
        for <linux-fbdev@vger.kernel.org>; Tue, 21 Apr 2020 03:48:16 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id d17so15880291wrg.11
        for <linux-fbdev@vger.kernel.org>; Tue, 21 Apr 2020 03:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cnTRejc+/uL4VELD5S9dyRJFvDdbBy0cpuLmyvhwS9s=;
        b=s5V9HFggyHQI3S/Is13cCbi+DFRk9OXNv03ZCLemO22eVQnTvw6wa0I2K3rJUgzr2J
         ky0vhEj3I9/34wtK6VdeuefFZwXmOBG7RDkTXemgvZHWPoNQOmly2L3oCZdwZlOrY7xy
         flYH8gK+rzJBbcmYpN+x3f6+5XPKUBY9sDhQUkYoqxRMqTTl03w9RerMg8NyiXIa7GG1
         32Goq+0qgPVhjKMGK9bCeMiBlIhCRoMdBmq6H5At1TKTFDqeQXzYcOGK5YKVdPISJKr5
         fxoUtXZTyUUuW0LeF721zOnkCKrwZLUHVGCFXv9p84jhjCxkNdKYNtCSIGNH9R31t2lN
         RnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cnTRejc+/uL4VELD5S9dyRJFvDdbBy0cpuLmyvhwS9s=;
        b=gRvyKhCU4nEHMMvkgrgmUvTFzYxEinBpfqUBtkZygSVbWcPRVsfZe2A16Vav4CSelL
         RfIM9dJP+RVidgs+iGrmurUEdBGdRvag/ocJQ9jeGv1F8QXoJxEG0xJOHSD6FH7GFFaH
         DdchE4lF4Vjdi9Wg3FB72yTIoop8PvicmW/D0zFHSgGTMm+IamqwUJ/e8DJoQEnDrSF6
         CyYKgnI3v7Br60n/sTnEXQF9fK0IzU4e8Tcuzfop9fzSb2MDlpti9S0yOyFk7UXzvLE9
         I49iFoJlmvCVZhllFA56/3ucIgQb9SC4CWQFlszuTUc3r+Mc6azC35FTdUGz7DleJ1b4
         NxWg==
X-Gm-Message-State: AGi0PuaMPUmUvWW1siJ8f5cEsmmXkT1CnOuiZ3wm7R4ou5tAL74zJ34N
        F6qmvehkv1JfQZUVpZsk5qa1vQ==
X-Google-Smtp-Source: APiQypIwa9395B2krFNcNyyAdYelgCq+t4aZ7CohG2sc/JAmhxlawamK8jCMmwcNCyO2wqDtX33MEw==
X-Received: by 2002:adf:9441:: with SMTP id 59mr23118305wrq.211.1587466095006;
        Tue, 21 Apr 2020 03:48:15 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id l4sm3222369wrv.60.2020.04.21.03.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 03:48:14 -0700 (PDT)
Date:   Tue, 21 Apr 2020 11:48:12 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 5/5] backlight: led_bl: rewrite led_bl_parse_levels()
Message-ID: <20200421104812.kgsdgv2r7bu7iqhe@holly.lan>
References: <20200417113312.24340-1-tomi.valkeinen@ti.com>
 <20200417113312.24340-5-tomi.valkeinen@ti.com>
 <20200420160154.4xxv37fofx37ow7q@holly.lan>
 <2233a194-bc8e-99ba-d302-edd087a3adfa@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2233a194-bc8e-99ba-d302-edd087a3adfa@ti.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Apr 21, 2020 at 08:52:02AM +0300, Tomi Valkeinen wrote:
> On 20/04/2020 19:01, Daniel Thompson wrote:
> > On Fri, Apr 17, 2020 at 02:33:12PM +0300, Tomi Valkeinen wrote:
> > > led_bl_parse_levels() is rather difficult to follow. Rewrite it with a
> > > more obvious code flow.
> > 
> > ... that introduces new behaviour.
> > 
> > There's a couple of new behaviours here but the one that particular
> > attracted my attention is the disregarding the "default-brightness-level" if
> > there is no table. That looks like a bug to me.
> 
> I think the previous behavior was a (minor) bug: how can there be default
> brightness level if there are no brightness levels?

I don't think this was a bug.

If there is no brightness table then backlight will adopt a 1:1 mapping
versus the underlying LED meaning the concept of default brightness
applies equally well whether or not a brightness table is supplied.


> The led-backlight.txt is
> a bit lacking (another thing to improve...) but led-backlight mimics
> pwm-backlight, and pwm-backlight.txt says
> 
> default-brightness-level: The default brightness level (index into the array
> defined by the "brightness-levels" property)

I think this implies we should improve the binding documentation!

The parenthetic text's main purpose is to make clear which scale should
be used when interpreting the default brightness. Just because the scale
is 1:1 doesn't render it meaningless.


Daniel.
