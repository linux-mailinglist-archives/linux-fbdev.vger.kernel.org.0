Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B454519C49
	for <lists+linux-fbdev@lfdr.de>; Wed,  4 May 2022 11:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347476AbiEDJxJ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 4 May 2022 05:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232291AbiEDJxI (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 4 May 2022 05:53:08 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE80227178
        for <linux-fbdev@vger.kernel.org>; Wed,  4 May 2022 02:49:32 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id l7so1849159ejn.2
        for <linux-fbdev@vger.kernel.org>; Wed, 04 May 2022 02:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=EudcOykdh5aF3kNmm/3lXVh2DihzLVkHLlOi3J/9ZD4=;
        b=UYqTEsH9NrVsDIxj7cqtPQKsKoAFsKesTKV8JGP5cfNWi9H9IWF7GiaMTJivacY/E/
         DZw50ypWFZO19EHJdqPJkem1R1XqPfRD3lWpdKXC07Cyupfde5jGkog9CLi2kdUpeNwI
         vVDflmlAQxBz8ijf9tR6yMCK3L3lHKuhx1yBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=EudcOykdh5aF3kNmm/3lXVh2DihzLVkHLlOi3J/9ZD4=;
        b=eiNR6+B/zHTb6UkfgIuDfPynsrX7yxZyLplMVWBVqAQ+DuOGV1NEY7wH3q6XhwxJ8n
         ubNrS+hAwuTraSAhMLmJ/39WwF/YRLleJcKLqZ4/FiB2gqyFDESImhzJvIDy0tSHBr5h
         O8Z6M2AInDLPphZv2W4ORddzd1v/0qsPcsuqE3o4aYWwiR0qUk40gKFNDhuAp1Rv4HGF
         U2WN/+63FxOcC3wqQs1AfQwIJ98EunlqG2fBvOcu+P9VcN8Eqc+tD/R/607fzt3n1wdD
         ImrZrpOyok7OWkUlloFIYicLfYlyW+azfFMrtTJzkTvEQ1l12/cKP4lURrz6KxrQlU3+
         dA5Q==
X-Gm-Message-State: AOAM533kxLW0Th/kPVHRmA3pRoJ1vXWzho52lzPJubYJRhJnm+QTaHVG
        Jl+le5sd5SK0PvHRoyq7f6Yj9w==
X-Google-Smtp-Source: ABdhPJzKNOoRcoRzmHgoEyAJlwUz+TObcoN0hAPgpnytYQRMA7fjPO2bgwrXwWAH7i0yOokzYttWVQ==
X-Received: by 2002:a17:907:7fa2:b0:6f4:408a:5216 with SMTP id qk34-20020a1709077fa200b006f4408a5216mr14248720ejc.564.1651657771422;
        Wed, 04 May 2022 02:49:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id h20-20020a1709070b1400b006f3ef214db8sm5431393ejl.30.2022.05.04.02.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 02:49:30 -0700 (PDT)
Date:   Wed, 4 May 2022 11:49:29 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Javier Martinez Canillas <javierm@redhat.com>
Cc:     linux-kernel@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Junxiao Chang <junxiao.chang@intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Changcheng Deng <deng.changcheng@zte.com.cn>,
        Daniel Vetter <daniel@ffwll.ch>,
        Hans de Goede <hdegoede@redhat.com>,
        Helge Deller <deller@gmx.de>, Sam Ravnborg <sam@ravnborg.org>,
        Xiyu Yang <xiyuyang19@fudan.edu.cn>,
        Zack Rusin <zackr@vmware.com>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        Zheyu Ma <zheyuma97@gmail.com>,
        Zhouyi Zhou <zhouzhouyi@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2] fbdev: Make fb_release() return -ENODEV if fbdev was
 unregistered
Message-ID: <YnJMKcz+C32x0sOv@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
        linux-kernel@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Junxiao Chang <junxiao.chang@intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Changcheng Deng <deng.changcheng@zte.com.cn>,
        Hans de Goede <hdegoede@redhat.com>, Helge Deller <deller@gmx.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Xiyu Yang <xiyuyang19@fudan.edu.cn>, Zack Rusin <zackr@vmware.com>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        Zheyu Ma <zheyuma97@gmail.com>, Zhouyi Zhou <zhouzhouyi@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20220502135014.377945-1-javierm@redhat.com>
 <e3ce080c-8ef8-f838-d4a8-b10cd5d5c172@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3ce080c-8ef8-f838-d4a8-b10cd5d5c172@redhat.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, May 03, 2022 at 05:28:09PM +0200, Javier Martinez Canillas wrote:
> On 5/2/22 15:50, Javier Martinez Canillas wrote:
> > A reference to the framebuffer device struct fb_info is stored in the file
> > private data, but this reference could no longer be valid and must not be
> > accessed directly. Instead, the file_fb_info() accessor function must be
> > used since it does sanity checking to make sure that the fb_info is valid.
> > 
> > This can happen for example if the registered framebuffer device is for a
> > driver that just uses a framebuffer provided by the system firmware. In
> > that case, the fbdev core would unregister the framebuffer device when a
> > real video driver is probed and ask to remove conflicting framebuffers.
> > 
> > The bug has been present for a long time but commit 27599aacbaef ("fbdev:
> > Hot-unplug firmware fb devices on forced removal") unmasked it since the
> > fbdev core started unregistering the framebuffers' devices associated.
> > 
> > Fixes: 27599aacbaef ("fbdev: Hot-unplug firmware fb devices on forced removal")
> > Reported-by: Maxime Ripard <maxime@cerno.tech>
> > Reported-by: Junxiao Chang <junxiao.chang@intel.com>
> > Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> Applied to drm-misc (drm-misc-fixes).

See my other reply, but how does this not result in leaks?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
