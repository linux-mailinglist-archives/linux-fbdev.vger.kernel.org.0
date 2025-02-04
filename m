Return-Path: <linux-fbdev+bounces-3681-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B57A26D2E
	for <lists+linux-fbdev@lfdr.de>; Tue,  4 Feb 2025 09:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44EB218861C5
	for <lists+linux-fbdev@lfdr.de>; Tue,  4 Feb 2025 08:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B862066D7;
	Tue,  4 Feb 2025 08:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GAhTKsst";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="92Wabo0H";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GAhTKsst";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="92Wabo0H"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E1586358;
	Tue,  4 Feb 2025 08:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738657321; cv=none; b=YxwHw/Y9KJuLljgClxXbyECBD8Owaz670c23p0KWoG0qmotf0hBeXUMTZjocUipjv5CXUzRZIe7UXLIYLtHTGWUc9rkPuse6kf8Iyu3dw8fs75FVv6zg5dgdI8OSZFKY0BMnVh2CNYJGyJZE/cfwwb/njjc/d0xZ4iXSqha5Zho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738657321; c=relaxed/simple;
	bh=FH96e2LpJe4cIHwd6J777iowm+apN3cWJUtIT4EW60c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lfUj99MnYplHZgaRWDq3Rjx9ak4Dlwf+xPcneqcN4mHbmBiyzkOw5vGI1BVzcPLVVpGhJjyHUZATOtrhYR+2ZATruVruV8xunXOghNEpaNYdMM3m+UJ6xmRmq9KwdjxmiA+SZOjcCiNxStS7nrUKt9/itwvxGTgS6mSpmBRXa+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GAhTKsst; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=92Wabo0H; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GAhTKsst; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=92Wabo0H; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3782021102;
	Tue,  4 Feb 2025 08:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738657316; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hZMrLILD1GBUFP/QjeIiEwC8yowC0yvAkHoIC6AkTkk=;
	b=GAhTKsst7OWgqD6NRAK9h4Ka6wjBMRAVuPk/fGwJw4aLGtKQwuvDpTcWIyi6OVpZK+umJD
	sRh4luTDqmbGedWHKGvErMN/DyLX2O3wFj/QjOHYVxUQayLhh6vtXysybpvwYZXNf5CfLs
	eA0PAoY6PsRjHbF3DRdZFxI+s0VsbWM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738657316;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hZMrLILD1GBUFP/QjeIiEwC8yowC0yvAkHoIC6AkTkk=;
	b=92Wabo0HMklRtEzpmbCNKve+Z7s+rTwgfVxKZTEbcR3fF9FQuF7dz2fwUrMTOtSxSyKvak
	WJZ/qqoHzWeqBrCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738657316; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hZMrLILD1GBUFP/QjeIiEwC8yowC0yvAkHoIC6AkTkk=;
	b=GAhTKsst7OWgqD6NRAK9h4Ka6wjBMRAVuPk/fGwJw4aLGtKQwuvDpTcWIyi6OVpZK+umJD
	sRh4luTDqmbGedWHKGvErMN/DyLX2O3wFj/QjOHYVxUQayLhh6vtXysybpvwYZXNf5CfLs
	eA0PAoY6PsRjHbF3DRdZFxI+s0VsbWM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738657316;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hZMrLILD1GBUFP/QjeIiEwC8yowC0yvAkHoIC6AkTkk=;
	b=92Wabo0HMklRtEzpmbCNKve+Z7s+rTwgfVxKZTEbcR3fF9FQuF7dz2fwUrMTOtSxSyKvak
	WJZ/qqoHzWeqBrCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D64CC13795;
	Tue,  4 Feb 2025 08:21:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id q0/2MiPOoWeXaQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 04 Feb 2025 08:21:55 +0000
Message-ID: <d800c5a5-b751-4f74-aee4-8dda1536dd85@suse.de>
Date: Tue, 4 Feb 2025 09:21:55 +0100
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] fb_defio: do not use deprecated page->mapping, index
 fields
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Jaya Kumar <jayakumar.lkml@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>, Kajtar Zsolt <soci@c64.rulez.org>,
 Maira Canal <mcanal@igalia.com>
References: <cover.1738347308.git.lorenzo.stoakes@oracle.com>
 <3542c5bb74d2487cf45d1d02ee5e73a05c4d279a.1738347308.git.lorenzo.stoakes@oracle.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <3542c5bb74d2487cf45d1d02ee5e73a05c4d279a.1738347308.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,gmx.de,vger.kernel.org,lists.freedesktop.org,kvack.org,infradead.org,redhat.com,c64.rulez.org,igalia.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Hi


Am 31.01.25 um 19:28 schrieb Lorenzo Stoakes:
> With the introduction of mapping_wrprotect_page() there is no need to use
> folio_mkclean() in order to write-protect mappings of frame buffer pages,
> and therefore no need to inappropriately set kernel-allocated page->index,
> mapping fields to permit this operation.
>
> Instead, store the pointer to the page cache object for the mapped driver
> in the fb_deferred_io object, and use the already stored page offset from
> the pageref object to look up mappings in order to write-protect them.
>
> This is justified, as for the page objects to store a mapping pointer at
> the point of assignment of pages, they must all reference the same
> underlying address_space object. Since the life time of the pagerefs is
> also the lifetime of the fb_deferred_io object, storing the pointer here
> makes snese.
>
> This eliminates the need for all of the logic around setting and
> maintaining page->index,mapping which we remove.
>
> This eliminates the use of folio_mkclean() entirely but otherwise should
> have no functional change.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Tested-by: Kajtar Zsolt <soci@c64.rulez.org>
> ---
>   drivers/video/fbdev/core/fb_defio.c | 38 +++++++++--------------------
>   include/linux/fb.h                  |  1 +
>   2 files changed, 12 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
> index 65363df8e81b..b9bab27a8c0f 100644
> --- a/drivers/video/fbdev/core/fb_defio.c
> +++ b/drivers/video/fbdev/core/fb_defio.c
> @@ -69,14 +69,6 @@ static struct fb_deferred_io_pageref *fb_deferred_io_pageref_lookup(struct fb_in
>   	return pageref;
>   }
>   
> -static void fb_deferred_io_pageref_clear(struct fb_deferred_io_pageref *pageref)
> -{
> -	struct page *page = pageref->page;
> -
> -	if (page)
> -		page->mapping = NULL;
> -}
> -
>   static struct fb_deferred_io_pageref *fb_deferred_io_pageref_get(struct fb_info *info,
>   								 unsigned long offset,
>   								 struct page *page)
> @@ -140,13 +132,10 @@ static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
>   	if (!page)
>   		return VM_FAULT_SIGBUS;
>   
> -	if (vmf->vma->vm_file)
> -		page->mapping = vmf->vma->vm_file->f_mapping;
> -	else
> +	if (!vmf->vma->vm_file)
>   		printk(KERN_ERR "no mapping available\n");

fb_err() here.

>   
> -	BUG_ON(!page->mapping);
> -	page->index = vmf->pgoff; /* for folio_mkclean() */
> +	BUG_ON(!info->fbdefio->mapping);
>   
>   	vmf->page = page;
>   	return 0;
> @@ -194,9 +183,9 @@ static vm_fault_t fb_deferred_io_track_page(struct fb_info *info, unsigned long
>   
>   	/*
>   	 * We want the page to remain locked from ->page_mkwrite until
> -	 * the PTE is marked dirty to avoid folio_mkclean() being called
> -	 * before the PTE is updated, which would leave the page ignored
> -	 * by defio.
> +	 * the PTE is marked dirty to avoid mapping_wrprotect_page()
> +	 * being called before the PTE is updated, which would leave
> +	 * the page ignored by defio.
>   	 * Do this by locking the page here and informing the caller
>   	 * about it with VM_FAULT_LOCKED.
>   	 */
> @@ -274,14 +263,13 @@ static void fb_deferred_io_work(struct work_struct *work)
>   	struct fb_deferred_io_pageref *pageref, *next;
>   	struct fb_deferred_io *fbdefio = info->fbdefio;
>   
> -	/* here we mkclean the pages, then do all deferred IO */
> +	/* here we wrprotect the page's mappings, then do all deferred IO. */
>   	mutex_lock(&fbdefio->lock);
>   	list_for_each_entry(pageref, &fbdefio->pagereflist, list) {
> -		struct folio *folio = page_folio(pageref->page);
> +		struct page *page = pageref->page;
> +		pgoff_t pgoff = pageref->offset >> PAGE_SHIFT;
>   
> -		folio_lock(folio);
> -		folio_mkclean(folio);
> -		folio_unlock(folio);
> +		mapping_wrprotect_page(fbdefio->mapping, pgoff, 1, page);
>   	}
>   
>   	/* driver's callback with pagereflist */
> @@ -337,6 +325,7 @@ void fb_deferred_io_open(struct fb_info *info,
>   {
>   	struct fb_deferred_io *fbdefio = info->fbdefio;
>   
> +	fbdefio->mapping = file->f_mapping;

Does this still work if more than one program opens the file?

Best regard
Thomas

>   	file->f_mapping->a_ops = &fb_deferred_io_aops;
>   	fbdefio->open_count++;
>   }
> @@ -344,13 +333,7 @@ EXPORT_SYMBOL_GPL(fb_deferred_io_open);
>   
>   static void fb_deferred_io_lastclose(struct fb_info *info)
>   {
> -	unsigned long i;
> -
>   	flush_delayed_work(&info->deferred_work);
> -
> -	/* clear out the mapping that we setup */
> -	for (i = 0; i < info->npagerefs; ++i)
> -		fb_deferred_io_pageref_clear(&info->pagerefs[i]);
>   }
>   
>   void fb_deferred_io_release(struct fb_info *info)
> @@ -370,5 +353,6 @@ void fb_deferred_io_cleanup(struct fb_info *info)
>   
>   	kvfree(info->pagerefs);
>   	mutex_destroy(&fbdefio->lock);
> +	fbdefio->mapping = NULL;
>   }
>   EXPORT_SYMBOL_GPL(fb_deferred_io_cleanup);
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 5ba187e08cf7..cd653862ab99 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -225,6 +225,7 @@ struct fb_deferred_io {
>   	int open_count; /* number of opened files; protected by fb_info lock */
>   	struct mutex lock; /* mutex that protects the pageref list */
>   	struct list_head pagereflist; /* list of pagerefs for touched pages */
> +	struct address_space *mapping; /* page cache object for fb device */
>   	/* callback */
>   	struct page *(*get_page)(struct fb_info *info, unsigned long offset);
>   	void (*deferred_io)(struct fb_info *info, struct list_head *pagelist);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


